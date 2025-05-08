Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FC3226CE4
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 14:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746713660; cv=none; b=kRdCCjJulL8poIGLemXF+INnOaYGhgzG/HakiaadgXDZo2os2P0RqhDHypgKvNx0pkoa5CbRC41NJMs+96q38pxh5KKjMUN29MTbnh4cN1c24rlk8hqpFdz18v3l0yWMq9zd2XJoTayUz24lB6ZUKJ86IOfmgV/HG2HerD1VkS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746713660; c=relaxed/simple;
	bh=gt74E+Pon54UuTZyO+orN5K3zqp0H68Z78zXQR5PoWQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ffAzCVzs8c/Tp0nvRk3ZQwBSGd/n2M/g/uN/Rb2wPRTjiukwVMcWmiZrwpvKAYQ2KLqa3IHnH+aJV8hGVY0xEUTDPPuToKXkJ9Krj4g3Gnj+8Z5ijZFwu428O9JvMzb0J+GaOlsFLdV79mp0ZHZSZyZ+ZkR518tOEtTAB427pTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=he7Zi8Ms; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="he7Zi8Ms"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCC04C4CEE7;
	Thu,  8 May 2025 14:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746713658;
	bh=gt74E+Pon54UuTZyO+orN5K3zqp0H68Z78zXQR5PoWQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=he7Zi8MsWAcaCp1UeQYK/PX5r7jt1vT6Xnos+NZAMfQWdjvKd7xElAu6KUAowFUar
	 hdFL4WEX9iEBYQlR3wz8nu/RaZcKqwXOlLCPh8VEZDJkKFHjkswSJC6cm6fSnf3zPv
	 wQ8qNCdvGWLIEprVTsmtTe7eEFbVVLWLNoHOnbTZa0QxzN5bE80O8HHvZCNSSxGHxS
	 WfYt67aQE2/atLKVQWfCQgXGYxxnvVyMiQqkWxUuhgAUbixAMjmZ7EKcDo2r2B/+PZ
	 yeuOtXtTqLzeOU4YXOEQTnX9E6+izRKWFRM4dRKaP7yPj4E4757SX1dCBBcoqqcdDt
	 BVe8CL26U7aLQ==
From: Lee Jones <lee@kernel.org>
To: Karel Balej <balejk@matfyz.cz>, Lee Jones <lee@kernel.org>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20250406-mfd-device-wakekup-leak-v1-0-318e14bdba0a@linaro.org>
References: <20250406-mfd-device-wakekup-leak-v1-0-318e14bdba0a@linaro.org>
Subject: Re: [PATCH 0/8] mfd: Fix wakeup source leaks on device unbind
Message-Id: <174671365657.2459720.504749254225457244.b4-ty@kernel.org>
Date: Thu, 08 May 2025 15:14:16 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-39345

On Sun, 06 Apr 2025 21:50:08 +0200, Krzysztof Kozlowski wrote:
> Device can be unbound, so driver must also release memory for the wakeup
> source.  Use devm for driver already having devm interface and manually
> disable wakeup for drivers still having remove() callback to keep
> consistent ordering of cleanups.
> 
> I did not update the drivers with suppress_bind_attrs and no error paths
> after device_init_wakeup() because it would not bring any benefits.
> 
> [...]

Applied, thanks!

[1/8] mfd: 88pm886: Fix wakeup source leaks on device unbind
      commit: 0fcb3bee6f9e004b1d52ad6e090bcd0ff2cc7add
[2/8] mfd: as3722: Fix wakeup source leaks on device unbind
      commit: 16e0c58e342867fec5198fbd0af7f93f49d12f42
[3/8] mfd: max14577: Fix wakeup source leaks on device unbind
      commit: add4c382ae0185ebdde685b5992efcc3052e487f
[4/8] mfd: max77541: Fix wakeup source leaks on device unbind
      commit: e1b513336240d05e43fb4f0165e2ff242cc5c5aa
[5/8] mfd: max77705: Fix wakeup source leaks on device unbind
      commit: ae3311e911012dc433ba79ef9d5cb6d3eb144223
[6/8] mfd: max8925: Fix wakeup source leaks on device unbind
      commit: a58fa75ee660144620e42abeffd517c6dab40ce7
[7/8] mfd: rt5033: Fix wakeup source leaks on device unbind
      commit: c85164efc5486eb711b376a15aecfd37c292c09f
[8/8] mfd: sprd-sc27xx: Fix wakeup source leaks on device unbind
      commit: 7f8bb8ef012ee27b601b778b3ef33223f242604f

--
Lee Jones [李琼斯]

