Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8D41DDA2F;
	Thu, 17 Apr 2025 20:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744921668; cv=none; b=Pbzk9yMoElpy3iBpQoCdEFXFxx8y2ixfGfYwnibolzbZ/Jt8KUwFlEkWvFboCx2rXA5RZv5cK/G057D4eYROomOLcudtzW0hniFx1Sfe5KFZGzebwfnVTSPL7a3vXUxl/FEHAufl9qZDfTqkZNZ1XMmsaoAuTI4C8Hj97c4qbow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744921668; c=relaxed/simple;
	bh=lIA/HRcL6BkCZF6NyQXASHIt+r/PGpnGcRYZxTpdBOs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=pHSVGCg2WTSbJxDzlOSmPZw7De87y3PWfootD+NsXaBZ1Q1IDcUdAFXNagtc3bRLj3szDOCmfx+t6csOG+24UrCKgps9lDlUu6XTMearV+1bn7S3sSzB7mzBHgQZQt6oIDDTfgL/WmuUQCbSQcgApbh2Hk0DG4aJNl2X1dsBqHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NXuhXcTa; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NXuhXcTa"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-736b350a22cso1112790b3a.1;
        Thu, 17 Apr 2025 13:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744921665; x=1745526465; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lIA/HRcL6BkCZF6NyQXASHIt+r/PGpnGcRYZxTpdBOs=;
        b=NXuhXcTaG9rqsURAz4b22lYEINxF14pfo70Zak0E11Xsfh/UrpCe/MEkIKtfZgqIED
         Y1GSYBjc00HCOWKMTAfHjh6UcxH+Q+vCiBQC2ezO4zIz4X79a+/eoxDZDOrWvCCzhcDa
         qtpZkBS85zJXLFRr/G92HUJ0+pg9IyE8ceXN1R0TsUt8DRmWyPG4+o3LFEvLUpAZ2umx
         0H9ybkhwyP48R1ZTcCr9/r2Dq2XUlS9q3M7UOjvJ3h8scIF3RQAwBJWwDJOsSjjxkFQ2
         etQNlolwdOttZtJ+napm4PeHBJ50oYoLprzssbUU1kJ5aoHIuDZbTX5r1GJWxfTabLsM
         3Uxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744921665; x=1745526465;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lIA/HRcL6BkCZF6NyQXASHIt+r/PGpnGcRYZxTpdBOs=;
        b=YJRsiGGvjNX+sap2YXJhmSos00H6s8cT8uKEt/aYCz5Dwm1X9vaNxVbU0P2hKhB+1c
         WdtV/XQZvHbSVqYWxo51lO82wyQJ67z96pCiLxD5NEZq2YtZLiS917K6TekI5VAZen9x
         8hWMo80ILLYcTrAi40uEV0PVoF7QfPIFHdYiCQUz6Y7IFHd5+SHBAIK5czonK8Rmi5m3
         tdpntQlfDhdGZp99pRAfp7av6rhywKb+5qYpaaQ2QusSK23jUgl7pA1uCcvsgCvpw/Q2
         D/e/+SAierXzb3YDsyG5TPzJ2piVCMkDZ4Iyb7zHjtdCPBczrCMbJbva3FBw9DbFhuCk
         WFfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkzr/fJQTloJ9+ZI/OBDpsyQ/R72Fo+2FJzl6mX4ifPKD26MhB+i2j1KYugn07kQwuaqR/yw9atD1LZbk=@vger.kernel.org, AJvYcCVB44Pxdue168TSqoVnqkakvfXJmIPUL9Tl61Pd65lE2VDcPEd8MXtqIwroEvMLpS2g+lJNmdnpxRzFNG0+b4GsUwP4eg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFy9d3F0RpRaAPmT0pDRBUNMtPSbqyYFcfXNqb1kE/Eg/0ldRM
	Pygg9x+spKNpb55+3RXZrNhMwAOCB50TzctzB+ONZgWw0/d4hGt9
X-Gm-Gg: ASbGncvhBARw07h2zzJgNmfVzPhPI/RHQD3TK+itZT8H02cISJzm6ChZsozzHVyWmje
	qz1dGKkwOrAW0/Ey1L2JOxyk9/B76TqS35gWAbSgyAoq2JqQEplwKSdLNeKfwbuyUs4hAXXxbWC
	bm2AiNqUCCEueRM6HWKNg5HQTkBHA2LcTzOTManCOYOeXiN/wDHRaGnVE1gbWox0dbHvlxbF2VL
	ru7qHsRte0yZuIHz7L+TM+VLnlBGtT3nyJxZH1Pz5fNc51xzIHo/S7i3ofs1VBH7QGWrd0TsShO
	mgMh+TjcHYACkvfn3dgS3XRM5RvyOJxi6A==
X-Google-Smtp-Source: AGHT+IEbKrBbVR/RHruqfYQbJuZavlzmY0ghM2eiyPcM/+gQdCRo8cGBs1yIK6cNohKY1nwH7HyNoA==
X-Received: by 2002:a05:6a00:3911:b0:736:5753:12f7 with SMTP id d2e1a72fcca58-73dc145740amr351604b3a.3.1744921664399;
        Thu, 17 Apr 2025 13:27:44 -0700 (PDT)
Received: from localhost ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e3ba8sm307156b3a.68.2025.04.17.13.27.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 13:27:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Apr 2025 17:27:41 -0300
Message-Id: <D9973T381GI3.KMDIB14GR4LO@gmail.com>
Cc: "Hans de Goede" <hdegoede@redhat.com>, "Armin Wolf" <W_Armin@gmx.de>,
 "Mario Limonciello" <mario.limonciello@amd.com>,
 <platform-driver-x86@vger.kernel.org>, <Dell.Client.Kernel@dell.com>,
 "LKML" <linux-kernel@vger.kernel.org>, "Dan Carpenter"
 <dan.carpenter@linaro.org>
Subject: Re: [PATCH] platform/x86: alienware-wmi-wmax: Fix uninitialized
 variable due to bad error handling
From: "Kurt Borja" <kuurtb@gmail.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250416-smatch-fix-v1-1-35491b462d8f@gmail.com>
 <14424f02-c800-a482-4d23-fd05f61cec82@linux.intel.com>
In-Reply-To: <14424f02-c800-a482-4d23-fd05f61cec82@linux.intel.com>

On Thu Apr 17, 2025 at 7:57 AM -03, Ilpo J=C3=A4rvinen wrote:
> On Wed, 16 Apr 2025, Kurt Borja wrote:
>
>> wmax_thermal_information() may also return -ENOMSG, which would leave
>> `id` uninitialized in thermal_profile_probe.
>>=20
>> Reorder and modify logic to catch all errors.
>>=20
>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>> Closes: https://lore.kernel.org/r/Z_-KVqNbD9ygvE2X@stanley.mountain
>> Fixes: 27e9e6339896 ("platform/x86: alienware-wmi: Refactor thermal cont=
rol methods")
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> ---
>> Hi all,
>>=20
>> @Ilpo: This will definitely conflict with the for-next branch when
>> merging.
>
> Okay, thanks for the heads up (I'll eventually merge fixes into for-next
> once I merge this fix).
>
>> Also, the fixes tag references a commit from before the split (same
>> series though), but ofc this fix is meant to be applied on top of it
>> (fixes branch). Is this ok or would it be better to change the fixes
>> tag to the "split" commit?
>
> Pointing to the correct commit is preferred.
>
> It doesn't look very likely that the series would be "split" such that=20
> only a part of it appears in a specific stable kernel so the difference=
=20
> shouldn't matter anyway.

Yeah, this is what I thought too.

>
> In general, stable people would just send you a notification if something=
=20
> cannot be backported to some stable version due to a conflict, and they'd=
=20
> depend on you to submit the amended backport anyway so it's not much extr=
a=20
> "work" for them if something ends up conflicting. (And I don't think your=
=20
> inbox would be exactly filling from stable notifications unlike mine ---=
=20
> one of those joys of being a subsystem maintainer).

Guess I'm still lucky :)

Thanks for the explanation. I'm going to stop worrying so much about
stable haha

--=20
 ~ Kurt
