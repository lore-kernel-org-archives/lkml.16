Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25085223321;
	Thu, 12 Jun 2025 04:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749700865; cv=none; b=J6OymbkaKcOpsRgHK9TXXJKeNq+GyA4GemhoDFeyb7QtzKWqEpqKxS5QMgnMmJx1xjT03O5ALeH+iV9KMFIpdOEiDC8oieOy31f+ozRBaj0+fAGfUWXWTmQ9t9T4qiiz42M7DwrNxyZM9+1EpSri+JqW/lPgqNpL//d1xE3+MRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749700865; c=relaxed/simple;
	bh=gAfgCoWf3j3yQC1Z32xPGcJfoYIcj1weQQ7cX82OrOc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PuIjSeKL8Ox8SueT+2R+pYI8d3ESIEc7SKTN7C2id38UpFZCEf+s5DFtsDjSij91glwezhFC19QvZOSQo0Ul14bhYW867flLgDq3u3j5DXokxobm8FR/ckKtwuKHEDX2afienb2UXGpK946Bf4MiX39klVoKgJTkXY7+Q1Msm9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TN93aQnp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TN93aQnp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31129C4CEF1;
	Thu, 12 Jun 2025 04:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749700864;
	bh=gAfgCoWf3j3yQC1Z32xPGcJfoYIcj1weQQ7cX82OrOc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TN93aQnphdC6cDFK5znw9gM8D5vFutfaB6JVPiIUS9kAdwri1u5JApIVMQctv5Xjj
	 atBcDtseIjSwaXcoyRnZJZKPXf5TcIgYtQrFqxdCZ7YPgOoOtGDgg0eL1Lg096n6or
	 9r25I+fXsT9Ek4l83kC7mMi96r7M05OoBmP3EqQsVx+aqf8S68CAcg3nGLXso5I8I9
	 hpQA9MhoZPMyY4HdDNniFjgJwYLGzES9uzm3tg/D1QectuR2mWp5fUiHFbYJ6BwZ79
	 YlZhORVuakmcl5S1+hmRaESEjx6FC2p9ozz0wzqzD0jxWGuUNFm3uO9RoB4LqIMIjY
	 1ZEbrNpvHW6AQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengyu Luo <mitltlatltl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: remove unused reg
Date: Wed, 11 Jun 2025 23:00:45 -0500
Message-ID: <174970084204.547582.13304867983228862385.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250525152317.1378105-1-mitltlatltl@gmail.com>
References: <20250525152317.1378105-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 25 May 2025 23:23:17 +0800, Pengyu Luo wrote:
> <0 0x17a30000 0 0x10000> is unused for apps_rsc.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8650: remove unused reg
      commit: 779d1edd42e487fd85659983a7d2f98cd68096b3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
