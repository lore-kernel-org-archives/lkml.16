Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4262AD00
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 14:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751724237; cv=none; b=UJAnuYBMBouzWt78G8NDrqaZMESHXYr+CtaTXKPQYePuzT4WVtP4KjRPY/qJvA6wFObs9cvMXGm8yxX69zA2ut62MbXuiPw/+pgdzvv75JJ/umkimm+5Wjd/sAw3OcFuqNVsucvQgDzia2xLOlPcw4iP0cnC+A+TQpvoeODpNn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751724237; c=relaxed/simple;
	bh=n6HXa/sf1p+SFqWAo1aM9scyMSHVU8I90Zz3Qpu/tAg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=IVCmnWwYJD5+P1sHvZUOhj+mR+XdNfpu42df4OL+YE7PnKnT8HcVWqQ4vKL4s2OVclyp/dOB2Ribpce8RZol8dIpYdDcLZCNUVet4dSySXDDZ+c1ttDp301TgVPpHjYehDleycfJZ7xMFhS4agl0tfT5FNod9osxiBCzizAVofo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CarYPtV0; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CarYPtV0"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4a5851764e1so42273151cf.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 07:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751724234; x=1752329034; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GxrMRQg3ClHbYVYGNow/NsJAM3b7dz8NkMi6RpKX/2A=;
        b=CarYPtV0BlqwbYNu6OFtJyIhnRXzAYQfwc34c/+H4CefoeJ+DkRjK4AzVkI02uPfVv
         5GBfwh2dNfpZrXEKlWzA8k+JXV8sWMU7WytyopVOZO3VHRbWopb/XwdwGWDf/S50J5q1
         GafXVFE1dcYRD3w5zl+bPjkQzTmS2UzhZI1p24Fosp+UUd/i+OKeqB9y2pk9Vz/XGj55
         pPx90n6RfHrxmgousSoR2gFDBssg9ZpWLTkSYK+gKbE5ldxrqJOjyBzMHPbUU7TbTIxH
         AHjoz+dIqxqHc3iTouwB0M3Zj2cTubZ27AwCwlXS59DPhYr6XwF3IugiJJAoYKYtXwOD
         nzEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751724234; x=1752329034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GxrMRQg3ClHbYVYGNow/NsJAM3b7dz8NkMi6RpKX/2A=;
        b=p5GtEa5kz9hYfFKafsATzMpJKKzmYtdiUzvcPtLYdr8oaPl7O4gfj0WYW3FR9/bKlB
         26ArmE5OZa2dHcqR31sVi3owCxlp41XjmULv/0tyyZS6IxHYnql9MwVJS0Yq78+S8G6z
         VhYlGUCVVRQZ/+Zmbx0oABBStgUSmqMARirVdD4Lf6Lgz55KyKl20cll2sHZLJFHPpbD
         28WuYKRKozC2PesVQ5/uTANnTJiEPbzv8b8Q+6pxM44QZfQtKQyupy9pDzEedWiJD65K
         qT4pPVxUBeQ+9zBgRFoW8zD3bOvDMNRAtWsy3dAClAlSCug5WXg3vUZKNZNw9H6DkmhN
         vdFQ==
X-Gm-Message-State: AOJu0YxH8zGSH3CQHcBh2FNIE0gVlXu+X3gqRqysOAfEQHTdfABMM2c+
	d0uyZGfJTp63gASeIjmEBe80757oOFI4m1M1REh65JEVbjdHodSOQWawf7sdpd8cEz9POQuPt5f
	l+sLSk1T9bqlYDpqOK8X74156NbveUoVcLMcqL9A=
X-Gm-Gg: ASbGncumjDJEYShyT2/15teU3jqilnwil10qBpPHG+NeQQxNPNcVipyt4xvEUbuCWYL
	7o4LVmf5hIi5+e/E/WGSmznT6G0mlHjBreLGjmcFvpxE5bdfGLBPM40bbH+Skq84axJ/Tuq65h5
	N5jBTE6njSO1VQTg68lWBxa8xTiRmC4BsWNN2+wKI9mJOF+F5/Obd94r92ym6kv0imAqRHNm+Ol
	MYKkQ==
X-Google-Smtp-Source: AGHT+IEY6b/ynhWAl1h6C3f51u4rjZJhhzYxkaAGggFXxLtoqmIKfLP5/KRoNhRDsIBpUhOBxumdCxl2s0Nh+FUhk3o=
X-Received: by 2002:a05:622a:1929:b0:4a9:a596:1c06 with SMTP id
 d75a77b69052e-4a9a68f9068mr40836551cf.16.1751724234173; Sat, 05 Jul 2025
 07:03:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Sui <sui999924@gmail.com>
Date: Sat, 5 Jul 2025 22:03:43 +0800
X-Gm-Features: Ac12FXxtAWIK8E6fonpOP4hlwShqaMn5caj8HtMgfPlSHxOQZyyAZflsCQ8Qr9Y
Message-ID: <CAObhpgjOZRsmZ3joXRO6qQMCN6_9ry7ZfGNMsvzzXVZSiYbt=Q@mail.gmail.com>
Subject: =?UTF-8?B?W1BBVENIXSBhcm06IGxhbnlhbmc6IGZpeCB0d28g4oCcbGFibGXigJ3ihpLigJxsYWJlbA==?=
	=?UTF-8?B?4oCdIHR5cG9zIGluIERUUw==?=
To: linux-kernel@vger.kernel.org
Cc: arm-kernel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

In arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts the properties =E2=80=9Clab=
le=E2=80=9D are
misspelled. Correct them to =E2=80=9Clabel=E2=80=9D so tooling and bindings=
 pick up the
node names properly.

Reported-by: Jens Schleusener <Jens.Schleusener@fossies.org>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D205891
Signed-off-by: Jake <jakecontactxyz@gmail.com>

--- a/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
@@ -52,12 +52,14 @@ hdd_fault {
         gpios =3D <&gpio ASPEED_GPIO(B, 3) GPIO_ACTIVE_HIGH>;
     };
     bmc_err {
- lable =3D "BMC_fault";
+ /* typo fixed: lable =E2=86=92 label */
+ label =3D "BMC_fault";
         gpios =3D <&gpio ASPEED_GPIO(H, 6) GPIO_ACTIVE_HIGH>;
     };
     sys_err {
- lable =3D "Sys_fault";
+ /* typo fixed: lable =E2=86=92 label */
+ label =3D "Sys_fault";
         gpios =3D <&gpio ASPEED_GPIO(H, 7) GPIO_ACTIVE_HIGH>;
     };
 };
