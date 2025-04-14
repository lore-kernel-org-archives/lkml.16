Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FAE2749F6
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 14:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744642093; cv=none; b=Gy8cbvC7jd+Yn2fyeBGTyu6nIzl8ONCdq2q4dMrPbkqN7QKbW3dzWKOxdTJnZ54LpSfrW4pQ4aaQMMS7XlXQzsZvQfnSY8yC68EZju1O7n4RBB8qiPjuq7XR7OmBCA+B33FwHewVUKwR51asProXPyUL+ue94ZU05NYHkyFAnI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744642093; c=relaxed/simple;
	bh=rhMCMHbUjfu25o78Qk0bXpRpxmEMmo84KsOZ4BfvPaU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DWkGTkSC9zoTh8ItO2zwJpkk8m9TospiHYLS2OUfG8jGot22FQ8S77gGQtMYcqcO7W2V/6cFwJFJMUmJ/poCBF+yt3FvrOvLBZ3VTleG0Ik4Rc1gVcWdxTczFquK2Bzr+3S9uTjuivYD1Vhb56eM+lD7L1xpJ0QdtpP4UXJ3eFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=tT8B/kr7; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="tT8B/kr7"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-85b41281b50so116328239f.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 07:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1744642091; x=1745246891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n9NLOZp+0Nb53rh8qL2R0uTQQrVDxB/y4kuMaCTOR7c=;
        b=tT8B/kr7C9kGzYJyLkTdE8v0pbWdmoya/a1TKYm1+s5zhY5feNjUt3kBkNgJhmjL9Z
         M9KA/yhWP2Xaa8PopnQyrba3Z8aSsBu5iNZiIltwRBgJJ/KU3vPrylIWoJYj4GiMLLZC
         dBrdaX3iieG0fHsN/hf1GkA/oQgc/HHD1F6RvVTCbGQOCLfWhChLp75iZQ9UaT0mSCRg
         CkaBFp2CoxzffjcUg+rVzG+4/i8/3l2DiyxyVmzHCtmH4Z1/xBET3dmyOcJ7QvMxDTR/
         k0Hx92/F2d55YHzJGFZ4vnYyDSFQy3X/8OSgfBdeZoePx7ANie8VPjsER1APaYiSGfFn
         /Gvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744642091; x=1745246891;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n9NLOZp+0Nb53rh8qL2R0uTQQrVDxB/y4kuMaCTOR7c=;
        b=OGkLzjsjwcNIE3aUKCJWS3JLXdi5zkMBOs508GZXc67dodPuWoiyfPR6xPtp47+Ejk
         HwF5rkTR3dzfhrWcZBHbTV+kaUq3xVWjN+3v+w0tBPA7nmjqyXa/pbEpNYSdNDzVsETH
         +B7G4DP0jXmh2g9epQ17al0p0TBDAv0qYftzNVJP+Me3MeJF/LEoZ8YDPq9N60pYIVJ7
         cjbkoS3HEISGKsDp5Tw7+//kdrdHRjF1sIdGpeRXacuU4wJX/AW1K8fCdE5AzdTyFnnX
         o4VSKL0BeyrPjgFadDyHQz4vM3OT7ERld5Q9KzqOthGHnpOUgsJD5207CKia6p1n1sEN
         RPFg==
X-Forwarded-Encrypted: i=1; AJvYcCUX0VaAo5Ic3FOBugfbXBhQk0d8rVoaAMrJbSHTg14aD5o6rSIOoYyXHQnRSewYxvI07Qp1FmmWSHexu6U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyliSNhTHawpkdMXQj+VgVrDzDS4t3C4UIYZGBDiljAuhEPfGrw
	/fin2nVKHJ1K79y7Jwe962bTtRxGmb69xncbj2cHgFT1Ay8lAMfgmsmTqY8eMS9JPHDqBZ23tC4
	4
X-Gm-Gg: ASbGnctO5NJ2vkBk0TYKdJynuHHqzBN9lgUO0aTpzUId2NdqKJ+bdwnxg+kgV7hO1Od
	Ssdi1lCPJd/IS/ZFpUAuNcSSLGjbgm7IuW6JAqRuPZnXVRcWwxi0hEKWqENjsmNO2Ps2HKS7DpH
	/Uq6MmRWNL9tkkvt8SxAY1MbJUacHn6upAQ39go0ieFyagrzDpFKDPcB4oLODZWjqAuYscLZFhX
	EYy2NqkJUkBbjCflbtJqhEuRQhRs0TVicTu8gWNdXvPIoS9Y4T9b7Uhnf+P59sEHY8m+QoKceA0
	dJY/Bb1+nnUf1BkB4edSFSO3mV1XrddD
X-Google-Smtp-Source: AGHT+IGPfM+faRGObScSF9y3uJ9gSmNmLDppjIkdwVGlwIxx/VnPJwjYYyDuKqqfztkP+4WddDe9ag==
X-Received: by 2002:a05:6602:2b96:b0:861:7237:9021 with SMTP id ca18e2360f4ac-8617cb46848mr1354025639f.3.1744642091087;
        Mon, 14 Apr 2025 07:48:11 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505e6bd7bsm2569671173.141.2025.04.14.07.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 07:48:10 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: "Bird, Tim" <Tim.Bird@sony.com>
Cc: linux-block@vger.kernel.org, linux-spdx@vger.kernel.org, 
 LKML <linux-kernel@vger.kernel.org>
In-Reply-To: <MW5PR13MB5632EE4645BCA24ED111EC0EFDB62@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <MW5PR13MB5632EE4645BCA24ED111EC0EFDB62@MW5PR13MB5632.namprd13.prod.outlook.com>
Subject: Re: [PATCH] block: add SPDX header line to blk-throttle.h
Message-Id: <174464208984.57766.7624425408061189714.b4-ty@kernel.dk>
Date: Mon, 14 Apr 2025 08:48:09 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-7b9b9


On Fri, 11 Apr 2025 19:20:18 +0000, Bird, Tim wrote:
> Add an SPDX license identifier line to blk-throttle.h
> 
> Use 'GPL-2.0' as the identifier, since blk-throttle.c uses
> that, and blk.h (from which some material was copied when
> blk-throttle.h was created) also uses that identifier.
> 
> 
> [...]

Applied, thanks!

[1/1] block: add SPDX header line to blk-throttle.h
      commit: 1b4194053f6b30556272ff11750dd518e067ea49

Best regards,
-- 
Jens Axboe



