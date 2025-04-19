Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FC718DB29
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 12:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745066416; cv=none; b=CzGM6AxyPbKQegIAbBrMq+2Yxm7KQftitsAf+HaOULil/j68782/IShg+7bL+jPJhbW6ab0JR0wvU+ZdvCk4Q2pzV0ZIP+0TiCVyii0lfT1JgY2RQ0BnI3L/m0aoU9wBrixxAEj5JTcUqmW2hC6rNproP2eswi2j6Af+2qRJPMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745066416; c=relaxed/simple;
	bh=Ol52LgJFB1vgjA9s9fv2tAdNFZ8IpJYdjuD1VyqI+fE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tEmeFgOzYLL6EYtMA7uU2N4ZhOWmY8GaCSaHvkpBmBhlHPOokHbCW7c/QwsIiAWOWmhlHqVrIXbrOYtjx5FvE+WxcUlDCvxgFUsgRk2f8yZrglEOG27Gtn3prf4Gpr2DtyeO30qtt3w8174pYKk1TpdfYOyzk6XF7ENjr6BY8gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NcMCmAfi; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NcMCmAfi"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39c1efc4577so1533349f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 05:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745066413; x=1745671213; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NFkUoIalnF11ld77bLxt7fgP6SNTAES2GfYghBL6rQU=;
        b=NcMCmAfia3ThouvAu8nB4x8nFUvuDy9y5OY46G9qCx3qW9s1ftqUNstBzqN1ZR7osc
         TGEuw2EBeCwu3uipvHj5nrIlh8KaFavzgKtM5TLQcys8qG7MC9ju+aPqr318dLUgQEaA
         h4/ZjdCjNfrUA082xnqvZS8kduXes+d6aFymC0XPiajrc9tPwQUM6iILPQXErcOBE9xt
         Id+GlN4w09/JpdHEHooEWTu76bbhET6WmxMGPiVM3gHGRsPnzmiRL07HK6zOMAVoK3Lp
         wCmsOD5PJcXvyByJf36D5LH+iRNe6IRipnTc8WAzgpJ+DpXCDZpFDXncmbuCLGVGyKOW
         JsYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745066413; x=1745671213;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NFkUoIalnF11ld77bLxt7fgP6SNTAES2GfYghBL6rQU=;
        b=spCyr4oCY+kI1laW3UX/cXhkTk/teanPnd9wb3oyvK+AGchQd3s3S+9pdJd1OPoFe8
         MyR0VU3iq2buNjp83domZ2boouf9VhN01X8znzNwE0duhnz3W+qKWFTCf3xVoN+X4BFU
         MtglMytz6N0oPc7gICz5bm7hgGgrc7ROBV3SgTKvEs9d+/yLPcXZKMjF7XBJ6IPzbXdJ
         P6OMZ/oweC3jthdTfmToQVVdHZ/DheAbSD8iP4Hs/NixM3hPCVbB0fSHfXZahgtDGVIS
         ydv+PGto/MIPLo83B3ldwSqJiaC8cNo38Uet/1H3Bo2CnP2w3eQXc9IMzcxjOPLWuUhx
         lFdw==
X-Forwarded-Encrypted: i=1; AJvYcCXuOzfZfsXpqTyadZ9Zq94DSwYnPHxa2yuOw5QeSqkJtmLtbJ5xDxSr3yzoo1PZ0CpE8IQCp3T65EPFkes=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxi9f+TIAzBPFPm/2MoQPNnVEzNWBr260yxO95XKDUwoK3v8SX
	P1rsZtWO+cd6lcshtMUBRar1nPOiDA7WPuOblysQkxjz+9VBL+Cv
X-Gm-Gg: ASbGncuzWzxZXD3CEfK+5JGQSR5VSkBY6miu9D0eHh/FSjBvDYGNwlPqWoNkpLaqOcL
	UveBgiNs1DD4cA4Ll9qyAbnffh4eO8wA81OutKJXDEE5yKHIWBwWSa6Am/sRoqEmBq/4D9FmyAG
	0TjwxYsHCxgigZ1TPJvdpimrzOJsuAnl2CfqvH1OZHismC1nwATMljwegqtnsYmjfCPwz1crrLF
	+UhWa3CqRlD3YAVU2H7vwrRWEqyq/XefdLcurNvYDr/igOETnbDgaW6Q6QWMZyJUcLwlbPgCIIm
	EKoF2JFEoADPvgSWZ9r+QALulUsSMeMQicrSmFfSEOyGhD66XRc=
X-Google-Smtp-Source: AGHT+IFboMiS1OBXG31n80CyHp6JDhmg/N+nheK2n0bl8jjO9adfQrgtg8IV8w1jkzVYvN4ECODmcQ==
X-Received: by 2002:a05:6000:4606:b0:39e:e698:b661 with SMTP id ffacd0b85a97d-39efba80464mr4001990f8f.32.1745066412769;
        Sat, 19 Apr 2025 05:40:12 -0700 (PDT)
Received: from localhost.localdomain ([46.10.223.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4a4f06sm5808353f8f.92.2025.04.19.05.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 05:40:12 -0700 (PDT)
Date: Sat, 19 Apr 2025 15:40:09 +0300
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com, 
	airlied@gmail.com, simona@ffwll.ch, aurabindo.pillai@amd.com, marek.olsak@amd.com, 
	roman.li@amd.com, make24@iscas.ac.cn, jfalempe@redhat.com, ivlipski@amd.com, 
	karthi.kandasamy@amd.com, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd: Replace calls to kmalloc()+memcpy()+free(old) with
 krealloc()
Message-ID: <bgwysgwai2p4d564s5pod5xw2q27r6egqkkiycjt6v5xtwnpwi@jh5ogfr75rfi>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Possibly gets rid of some redundant calls to memcpy.

Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 56bc2644e492..7ffd0d8f9897 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -146,7 +146,7 @@ static void amdgpu_dm_plane_add_modifier(uint64_t **mods, uint64_t *size, uint64
 
 	if (*cap - *size < 1) {
 		uint64_t new_cap = *cap * 2;
-		uint64_t *new_mods = kmalloc(new_cap * sizeof(uint64_t), GFP_KERNEL);
+		uint64_t *new_mods = krealloc(*mods, new_cap * sizeof(uint64_t), GFP_KERNEL);
 
 		if (!new_mods) {
 			kfree(*mods);
@@ -154,8 +154,6 @@ static void amdgpu_dm_plane_add_modifier(uint64_t **mods, uint64_t *size, uint64
 			return;
 		}
 
-		memcpy(new_mods, *mods, sizeof(uint64_t) * *size);
-		kfree(*mods);
 		*mods = new_mods;
 		*cap = new_cap;
 	}
-- 
2.49.0

