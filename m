Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDC41DF757
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745307145; cv=none; b=LDxhGK4dv0NZSOdBtz4O2LtH9RhdefskynXraBdJ3cBQMsRAKe8voDs/7jdRwlaKbRrw4s0St3JxsDPmk+JxoCsefBIMrL5CoP9HiB9A9X2Oq8JjmZGJaSfZOY2Fs3R84FbLlXuMm562QJaI0Yn5gz56faxOZXfpcrIyejk6oUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745307145; c=relaxed/simple;
	bh=eNHC/Vehgh5z/wbKY9zwOoyvw/CqJLyv6xtE1wCnRHE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=L1I3wZd0AwkkMdeu79BTAzcAH8eh540xZA0ha8gmOLnDi35ZEK0/tBC30RylSAKhaE1dslVORJPlGDaBhjMjs+Ad3IcP0VRBj3loZAByrC1N3xXgXGUNOBjjdc+UAUKdC1VavmeL9jT+4cDSLYD33lf1G+lRzxxE0QSJ+vMsVOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dNRk9u+p; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dNRk9u+p"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39ee651e419so2608868f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 00:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745307142; x=1745911942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b91x6W4W3YM6MatYMmgJu4q6pcHS8Em6ppy8O0swZ4w=;
        b=dNRk9u+p5SZZ3W0deAVFIUfFnbTs800XtzR6vWGcWBJhu60/U4xyFE3027fnWPAYoj
         DFeKwLQOe8sMKtPMu+NjF5hmjXwZbLFqI5feOOGAvZAnZIipvz3J/lrbG5WFUH1vYoFo
         mvLycbL2kyY7gRiLD1STMTtfwUHc4zz39DDHPUSKYn7OYfG2P9iCKuVhNSuOAfUEG3gy
         98PM4sBh+oPk2L2JzAqJ+O+CWV833GylOpK7Qne8s2e0U6yy6FjK6SHL+RqMjtla3yEM
         8X/YTRMPPAHNfh4PIG8Ir7k8BM55+oCY926Ea7SzBCmX1hOR4/uB0yv3vZ5oxPDAsgob
         78qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745307142; x=1745911942;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b91x6W4W3YM6MatYMmgJu4q6pcHS8Em6ppy8O0swZ4w=;
        b=hxbC4EMhAl4iEgiXu2rkfPJR//46+4OISOisVqw67iqN1ubJErN5oVsT+uNc/19r/A
         Tx3t6kPIIp+iyNwVhIIopv0MTIj27QLXQj1frc/D76cbmw9e3C7OZ4H7p8/u9vMkHtad
         UMF7Zfjs6WD6i1160g7UQpnXCcC/gCYz4m/gDzKQRzwxRWeQDa9nqOBHorwnEKW2AOsL
         1ASmg85nNRhsSzpLSNo/rGMayJ80J88m3uf8MG+cAAaHHjxhIiCXChq2isca20zEB0wT
         b83CLWHqdY57F1KxmbCuV+rE6HsI0CpRtXz6DJZDleTPHi5TahzaPTVYdOGsT4pDjiJU
         UiiA==
X-Forwarded-Encrypted: i=1; AJvYcCUADtQqoYLE5Nhm+PRkuSm9SrDIHr5srmgGZewSmvoG5Ipn+exQ3Ib8aYHdm7CpmmkXbh05NLgRe2SmKk8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3QAgGmMcY36XG7w3jwUYtOpcSMuJ47tiDt7nnw6oPXQf93bor
	Ewo02VZ9qOzI+GIzIsvd6ErgZED6jxkEe1jqb+2/xe3Zlvu4U6Fx30LnjagVtXk=
X-Gm-Gg: ASbGncsdinkd3XzouTCvjwHb4GlPAxVUjRB6QpdwLlfzTzt+RWp11kRBLI0fSyNzyJX
	uYgh807yPjzbv4faKdZj8Xyb+qXWFnXoWKUJWzszG41Nih2zh6LqsvjC8CYeAbSifsxXaBSrvKr
	HaNKskoEtsLfffvtijVM/kS/6M3EGWZB2Er0cRmVx9oH1M5JI/xHRxvwjZdoYsvu+/pLTLh+tZw
	X/azaup69+9wKhdPyZDa7ZvbElL4oZJcye3aEizrFtOV8kP4d6Su3jNHE64JxdrAY3EwJqE7XCU
	sQNq2RtPJdslrTBFCVCTcOIw/SajK0GHtNc8QLNmXx8jckciwkonERi4OtYOhQ==
X-Google-Smtp-Source: AGHT+IHVx3fFkWbafwHn6ntKq7zb+0naan9uw6HPP+RnEoxKfpoIH14Qff0Qd5oTwC+j37n0ll/b5Q==
X-Received: by 2002:a5d:6d83:0:b0:397:5de8:6937 with SMTP id ffacd0b85a97d-39efbae3fbcmr9450832f8f.41.1745307141909;
        Tue, 22 Apr 2025 00:32:21 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43ce6bsm14346607f8f.55.2025.04.22.00.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 00:32:21 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chuan Liu <chuan.liu@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20250415-clk-measure-v3-0-9b8551dd33b4@amlogic.com>
References: <20250415-clk-measure-v3-0-9b8551dd33b4@amlogic.com>
Subject: Re: (subset) [PATCH v3 0/7] soc: amlogic: clk-measure: Add
 clk-measure support for C3 and S4
Message-Id: <174530714130.2805699.2160081120473599366.b4-ty@linaro.org>
Date: Tue, 22 Apr 2025 09:32:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

Hi,

On Tue, 15 Apr 2025 10:45:23 +0800, Chuan Liu wrote:
> Add clk-measure support for C3/S4 SoCs.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.16/arm64-dt)

[6/7] arm64: dts: amlogic: C3: Add clk-measure controller node
      https://git.kernel.org/amlogic/c/72e295292d3d1522d3ce628d07ef6a924e112b73
[7/7] arm64: dts: amlogic: S4: Add clk-measure controller node
      https://git.kernel.org/amlogic/c/0d057d35f3714e6786013772c830a976c2530894

These changes has been applied on the intermediate git tree [1].

The v6.16/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

