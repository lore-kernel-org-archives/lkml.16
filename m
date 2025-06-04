Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4695DDBC
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 02:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749003615; cv=none; b=WH/yLyRRCnZ1FJqUhjzEsWdLQC//njN0e8/PnhQclPkPmj8VPfOQU+DRMz9C1UPxnYQ+aXJYHohYCsopfnEL5P+I4Jol4Tc1DmjWgJQCu/iubmNeDV/N++X7mBTYpHyujr67sx0f79bOOVoOQBP6F38JfSsRzkfksM7MO25z9xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749003615; c=relaxed/simple;
	bh=aqRzIH4YZmOMMcRlcaEeuvd9lr4Eg/uYOhHtEzdtK8o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=n0kDDz9i/Co0K46JFpg7vs0fYShDyaKTXabKALQ+wcLKuERQ14TlKgFlC/3YKDbwFIL+ilBN9pLjmcSYLAm4KHS10BKyoVSn/SNb5RgO/WZO4lw/iRMAIKeJoJO3V+VRu52NUFNeV7/xJqceXHWLyp3Lcpplau1VEgF1/8MGrug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=0cItEXK8; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="0cItEXK8"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-86a07a1acffso497071939f.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 19:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1749003611; x=1749608411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qejrTtwV/N3l/netOhR9CrpngsFpqe2KTsbhYRzMHf0=;
        b=0cItEXK8PFZ1VIm2GTZ2G7kXuONWELnJxtCCA/TZB7XlNkbwYcDxns9uXGcwi3H9nQ
         3bcvzomnOoYbpNjx7L5B4W/3Tl97+85+vtSmxt1fQmVHVsx5aMJXFpsCupofjGVUwrKk
         UiFuNWCmjJUi8Ky6zuqa8OT+euSseRwXgWiEAyJq3lvHHetkzOTAM77e2lrhEyNUJrAC
         7MBKns5SkGNAKuk69JZgHhPGzfV2FJsfLveY7XZLFZjlLQEIB2koYX2j04D8ZKyWHmsD
         kKgopRbIyruqOztETeZptuqjqrr9pHEu7+l4rfeuUsMc0NqIGeJIcyNb/RSocA+pOPkZ
         qYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749003611; x=1749608411;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qejrTtwV/N3l/netOhR9CrpngsFpqe2KTsbhYRzMHf0=;
        b=UQMsuxijizlAPj3newBnRzthyuavs9Vi4Rvb+C+1XC9vMypwbPpfFKZo41Sqgpu5EE
         aoby/Jib4ynTlBr8uwdJ2c97lV2Np6cLWUKULXI+kMBkN3UMELF/ot7hvurs0T8Xn+9m
         UC2WPlkFk8z/5Fh6v2aOKNez68SYbE9rg/5C+tTXJCggO0NZptIVbyXb580rdIAxTlyb
         PxFaMmt+v5wQdelNEtCqEVVq1axFqXWPdbB8ppXNof8R+mnqdbwbKbTgyj7dxKfCp5uW
         j3HdSi2tzBm4/gEbqtXOLsJ5pDeWoO51c8Aov0xDh/QxCBX2xGyHUEMup627jLZ4N5RE
         7apA==
X-Forwarded-Encrypted: i=1; AJvYcCVRbuIxsB2hP04+m62Aknm7gkbtATmSO0nMCxg/h3nSFr39WPnbOsfHMypzLwO8sZccbKm0X9yxEAwmcwg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzy5GFANIUmg1cKv87KMd3QW06XdEfcu62Ydk+4/5WdECedgii
	40J/ez6nbPFpaKkZ96wLggIGZZj6QDm197aKpBOAs4Han7WTrUL7q+2izHkQgnKDAv27OIIr9Gd
	oH6eh
X-Gm-Gg: ASbGncvZKxXVhVJkiPEeXA/67MinFAr960aOj9mRDInRpQqql4iECSWVtTB0At4yzhL
	55HxTCT4meklw+M+s+zVJqiV6C52uquNOaZwVm+UDVOjsTtiyugJAcW6dIObjN6sRGy1JbwuiRz
	LBPyljEkyhmkVe2q+xnSdbaAVIxbKAyNSVE3+L7GywvGjO1wBX7+OJ+ANiGVf47tmp9GSB3Ro/J
	rOZ83sM7zGBjhJVnVpd5wJa4/Pcz2dnqtypzDSqf5QipzdLb9u4pM7YQmsrR+FhyN7tiFQjHkOD
	geqOkJ9xKnxLRxJgNCRtcyOEEvEM2Y1Sxi6WsYXlTL4KBbnlAqRsWA==
X-Google-Smtp-Source: AGHT+IG0g/LKKvwE+q0o5yidPMzs2yIX6t0WlWWtUgIsIU2EQk6Leb9umH6a08mNT2boXGRAuOfyJQ==
X-Received: by 2002:a05:6e02:3193:b0:3da:71c7:5c7f with SMTP id e9e14a558f8ab-3ddbedf6e64mr14260415ab.15.1749003611511;
        Tue, 03 Jun 2025 19:20:11 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3dd935a7ad0sm30334405ab.66.2025.06.03.19.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 19:20:10 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Ming Lei <ming.lei@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Uday Shankar <ushankar@purestorage.com>
Cc: linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250603-ublk_init_fail-v1-1-87c91486230e@purestorage.com>
References: <20250603-ublk_init_fail-v1-1-87c91486230e@purestorage.com>
Subject: Re: [PATCH] selftests: ublk: kublk: improve behavior on init
 failure
Message-Id: <174900361050.109618.15847979671218890744.b4-ty@kernel.dk>
Date: Tue, 03 Jun 2025 20:20:10 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-7b9b9


On Tue, 03 Jun 2025 17:38:33 -0600, Uday Shankar wrote:
> Some failure modes are handled poorly by kublk. For example, if ublk_drv
> is built as a module but not currently loaded into the kernel, ./kublk
> add ... just hangs forever. This happens because in this case (and a few
> others), the worker process does not notify its parent (via a write to
> the shared eventfd) that it has tried and failed to initialize, so the
> parent hangs forever. Fix this by ensuring that we always notify the
> parent process of any initialization failure, and have the parent print
> a (not very descriptive) log line when this happens.
> 
> [...]

Applied, thanks!

[1/1] selftests: ublk: kublk: improve behavior on init failure
      commit: a2f4c1ae163b815dc81e3cab97c3149fdc6639e3

Best regards,
-- 
Jens Axboe



