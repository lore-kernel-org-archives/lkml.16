Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661B0E545
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 15:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750519137; cv=none; b=oD1Yo3qQp4g/g2cru50J1NJXebLrpCf3b+goRXa0w18QleHWq0kM7+JToCw/RQlJ41crbgAukAFhmauz337XJjRz6Y9MheKDEDQjJBNi9XaavK9oEcyicwPeYamQC64VGrYBQm2ZDdUhtIpdjKVUsuqtX7Y13wqDHyvt7R3ELYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750519137; c=relaxed/simple;
	bh=tjKrZCbWpfg3r5pr2zmj4X9W+p5uffoo7a6en2/CBK8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=bqj0yPCUsag6/pEhm6UgZ2G5TXJ2BI2ASlcszQxyo9lPP3iDp3lRyTx+I+NHI/iw1z1a2nZGKj116+zxR7laPSYluj5z4maAIsh42LPX+jhUznn612sLtEWmfPjdja03RzTzSSnjrMdNdw72gka6N1Pkah4ptL2SQuWroJ84qlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aOSFqs+T; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aOSFqs+T"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-453647147c6so17460195e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 08:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750519133; x=1751123933; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ID1LpGQL7wBZfMuzOe2EP3tHYeGa/XqzG9jcaHohObI=;
        b=aOSFqs+TJG03/46GuZels5VIBf8x2E8eUmoOptSjiKc4hiHoR+W75x8scPFViRs8aN
         ECRYGLALFyFqMapFhLXYWER67Lr4wrNUSeKv6wTiLc9X/nc9cMOLmwP5Xpj+kuaJwql9
         /qUikhAOSoFZFVy2O23OMHLa3o0o24KM/S4XbzgaNGDVG/RbKokULPCZNee+SC+bQKN6
         bop9RWvvYdDjoV7UmUxyC9dUDyvV2bW0DpEFpeWnvYeNeNpqJcKsf43xXmlREydd53vU
         CU35u9sKTWOfXQSWjKaVD0UYSqzSvkBCXDAoo0DKGTR/T5gFkZ7iyC8GSJRZtiMjDbli
         eTxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750519133; x=1751123933;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ID1LpGQL7wBZfMuzOe2EP3tHYeGa/XqzG9jcaHohObI=;
        b=tL65IsDg57/qB9Fbf8vzJLd4eztW19IrvXN5A6ZikPgYLudqJHMi/cECUKbpn37oCM
         syFRmMAi2rO40JIPxl9lXC3LpLHUach7YvhiXbcGhSm0mAKsfStR5rpO+le6+7FGYDIV
         Muisf3XFHhuD46lw4SpKXqri8Pi1wIrl+jWg7ZxQU+u/erz/pCXmXK76QmIAN9wCSsCG
         vk8KPw0WnBSYEiAWbtV/9Y8hUVQAz+pwMDh7TcswC9N0Bme8kjsYu6eCwPpv1iNmW8z9
         rdu7SWfNQFJooqwJBAyYryr9Bnbm2WGLDSoICewcJhXpLgAkr5BPQZHMz5AtOsgI1mjo
         pqBw==
X-Gm-Message-State: AOJu0Yxu4vqE7f6tLlW5DKP+OZvRC9H8egAQMtno6qEiSskev5xuCgAO
	gQZ3fmKNgV5RG7MP5W5O2v6lMM9jKhpi0O9mhvzOuCK6vvyMPkFcL9XovC8hNvtIHPBjzUBZ6sN
	I1hNlGP7P3FtEfrri9h5ATDi1MiRAxk1a35mK
X-Gm-Gg: ASbGncsYYvdtR5DQVrsdUmWU7ETEEiY6kkjAki/JyjwOXBhci38X3WSEXwYgi+87GYY
	EulS4Ikxd2xoMggMVPRJx2LqQwX2hVIZThtdBQIqgenEg08I+lEeylZ0e82q1P61AzdCv69cNFh
	L892ewq4Wg5iTnXA09ig+8rm3ayOaoyZX1ap/PDv6WBPreM4DajHpM
X-Google-Smtp-Source: AGHT+IGFFkWs0v+oHaqguPggxHqcYF6J700ttKO9QT+CJz1xtbJjbZs6p9ink2qFj79QUAyfET5+2M8eUAzEa+zmC8s=
X-Received: by 2002:a05:600c:450d:b0:453:2433:1c5b with SMTP id
 5b1f17b1804b1-453653cead1mr60619415e9.5.1750519133274; Sat, 21 Jun 2025
 08:18:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Walt Holman <waltholman09@gmail.com>
Date: Sat, 21 Jun 2025 10:18:42 -0500
X-Gm-Features: Ac12FXwQA-yjIG99XqzTyfnTKrJOLAVV8_eA1I03gV_gI_2r_zumkIuIkY5cspU
Message-ID: <CAMb39_mAWfeuyDjHR4Ej9fH=PXdH0qUda50R=iqGKVzN1mcHPQ@mail.gmail.com>
Subject: AMDGPU - Regression: Black screen due to commit 16dc8bc27c2aa3c93905d3e885e27f1e3535f09a
To: linux-kernel <linux-kernel@vger.kernel.org>
Cc: mario.limonciello@amd.com, alexander.deucher@amd.com
Content-Type: text/plain; charset="UTF-8"

Hello,

With the latest drm fixes this week on 6.16-rc2, I am experiencing a
black screen instead of the sddm greeter and the GPU appears to be
locked up. I can ssh into the laptop and reboot it, but that's about
it. I have bisected the commit to commit id:
16dc8bc27c2aa3c93905d3e885e27f1e3535f09a and upon reverting the
commit, the system works as normal. The hardware is an Asus Rog
Zephyrus G16 with AMD Ryzen AI 9 HX 370 w/ Radeon 890M video. I'm able
to test patches etc.. if need be.

16dc8bc27c2aa3c93905d3e885e27f1e3535f09a is the first bad commit
commit 16dc8bc27c2aa3c93905d3e885e27f1e3535f09a (HEAD)
Author: Mario Limonciello <mario.limonciello@amd.com>
Date:   Thu May 29 09:46:32 2025 -0500

    drm/amd/display: Export full brightness range to userspace

    [WHY]
    Userspace currently is offered a range from 0-0xFF but the PWM is
    programmed from 0-0xFFFF.  This can be limiting to some software
    that wants to apply greater granularity.

    [HOW]
    Convert internally to firmware values only when mapping custom
    brightness curves because these are in 0-0xFF range. Advertise full
    PWM range to userspace.

    Cc: Mario Limonciello <mario.limonciello@amd.com>
    Cc: Alex Deucher <alexander.deucher@amd.com>
    Reviewed-by: Roman Li <roman.li@amd.com>
    Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
    Signed-off-by: Alex Hung <alex.hung@amd.com>
    Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
    (cherry picked from commit 8dbd72cb790058ce52279af38a43c2b302fdd3e5)
    Cc: stable@vger.kernel.org

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 41
+++++++++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 14 deletions(-)
