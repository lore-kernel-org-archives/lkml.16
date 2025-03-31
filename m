Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4243D1E5B8B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 12:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743424471; cv=none; b=rZ9uVYNzGska8lQtZSjbAUWUw3h+dahrWlrjz0/EZoJcOIHJWNWwWEf4FOwqrevqlhKyRQqjOCo/2GRhaU5s64zLOxyxawMQDvQw4tdSn/PsLgmp+T8cbz8kjpb6KjrCwIUjuByw7rNcv2uPZLtlMRYyf/dGJIfQ2hNOIWE0vwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743424471; c=relaxed/simple;
	bh=hgubZ8v5IYMlWlWz7IWc4ZP/Fpz45adatWKCfG7bouM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aKJaauVwht/7AcMGhJjz1cCqq2WpwCm7KYCO/7OZ/XE1Du52Sk9pb2P7yi+/DWGt3QM5dlmnf3wtfh23VK+79B5B3QX08F/zYa0HETmWXVZU7zAvg+FaWrnhbvGh0IoEYIqNsz28vA8WS7sconNFN3M3H77MHP/Dtw/UFop5cu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P+XZ/CNy; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P+XZ/CNy"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so239075f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 05:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743424467; x=1744029267; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8C1B/iAjfxZB5rM4ON16gPgb8RTIZjhmtB4Xg7w4JZc=;
        b=P+XZ/CNyZRAj+hTgJZ44xF6qNZY/DEUdzISPaVoMvv+vWZClsTvLS0irvRaVYm8Gg/
         Q3rudI+4wVE/BqxOUdMhpbM9zNRyb3zhhO3Ggu4//xmayQSkH7WCjbEUoR4xrCnN5JkJ
         qyoGMswJOzU+rYOHTxiI5NfAnyafFwEY/aMk0FmNNqc2X393jr0Fk6gp6OGO1lpHlVA0
         pzyJTnHaj6ep1qC4Hmqbg52F1/ZXY5vRE7uWDJLztXDB75zRVl9axrgQpnwpVllngHtv
         dexpGATSBQ4Jce8sAS0KmoK4z+8sAjHahExGYXqyuSm/dHqeZGz/rsKR8z+BmyzY/QRH
         2W0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743424467; x=1744029267;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8C1B/iAjfxZB5rM4ON16gPgb8RTIZjhmtB4Xg7w4JZc=;
        b=cbk9AD0vF947xNX09SCnaKlpb3smjvRQbaEHJJCePlDfMA0eN+Jfco7l7hsFIz5s2+
         wodLH0d6V0jjIImGIlY6j2OzVtcvFVnn81FmBtWFccGeyzPs4t3iSd40EOknnbiL5B07
         2RhBXyV7f8mtq1GiIunFw2Hd7/mu/OJMkXxAY2/EHal8QRNYhXlimhpJKNEHgPv6Vr3b
         BVR8dZjGCuiKKXU7cKNcoiLnVFiqu362liYpPenNS31WdNTZ8M+laPqcFL+TswOzwnC7
         dMB4/J46hK0cRzv2b+DJFptyLAmj/FvsGoW3JvjoQTZvCgrPTkn1I2lBCoOtZLfAYHKv
         w1XA==
X-Forwarded-Encrypted: i=1; AJvYcCXwc9S2qFbOI58o73oR8Iy8/Ryz8T6XPF1vy0IYvdt5MJcIUmPSSSdovwj7AqALxu7sYb1LngdrWxhw200=@vger.kernel.org
X-Gm-Message-State: AOJu0YzG3d75bplgqyP2Ylf9o2AnoeTQv6LikZRennQvPHFmlrfRilap
	3oaelWEqA0/HnXzqFeYuqhuvItpN3mtaC9Db36Qdp+JdldLa4tBq
X-Gm-Gg: ASbGnctvlAYdOhW6xaGfVIuxgR5SFJ08Ug6sIBpD8dvNGMPx7jp/M3vdZ1DEV0nJ/Xp
	rz0vfWMStrRsMr339J1LW6Nl1YU7EvZJIfLnkXYHtFUm3UaTdndlxumChdv6Um4NgImV3W5ttvJ
	94RL/Gy5laDYtEqX1KEiVocLwdJObknKnde7WClmigj8OHVnzN61GbsqVuFjyuNTKqY6hvfVs/v
	DMuirq2CTp8BcLoDKic33vXzOlgOK495LLqIiYMkotmI0huV0PtwG/VY2VtBniByQ2bzwiqE8Ae
	eLS7sbch6i0FkZ12UAEayptCGJXTt3gBtzaG5b+3FgW0ZEV4wDczDDhgOovBYSyZVGz1EMcIgOM
	ViDLhXNb8
X-Google-Smtp-Source: AGHT+IEfunH6HBm1Y7PMm/0AssIfHy3J3Wc1+rqe+wHnYUK4e/iGLilXY3nFa6l/MWKO2U0EbJxUpw==
X-Received: by 2002:a5d:59ae:0:b0:391:1139:2653 with SMTP id ffacd0b85a97d-39c1211d013mr7275853f8f.52.1743424467274;
        Mon, 31 Mar 2025 05:34:27 -0700 (PDT)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e393sm11326406f8f.72.2025.03.31.05.34.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 05:34:26 -0700 (PDT)
Message-ID: <2a2e9a4c-b888-45e1-a191-847dd8e7cb9d@gmail.com>
Date: Mon, 31 Mar 2025 14:34:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: replace use of msleep(<20) with
 usleep_range for better accuracy
To: James Flowers <bold.zone2373@fastmail.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, siqueira@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 aurabindo.pillai@amd.com, alex.hung@amd.com, skhan@linuxfoundation.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250326070054.68355-1-bold.zone2373@fastmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20250326070054.68355-1-bold.zone2373@fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Am 26.03.25 um 08:00 schrieb James Flowers:
> msleep < 20ms will often sleep for ~20ms (according to Documentation/timers/timers-howto.rst).

Our display team has to decide but I don't think that this patch is justified.

The time given to msleep is just the minimum time necessary for some HW action to take place. Waiting longer than that is usually not harmful except when you want to optimize total operation time.

Regards,
Christian.

>
> Signed-off-by: James Flowers <bold.zone2373@fastmail.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index 2cd35392e2da..2d225735602b 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -682,7 +682,7 @@ static bool execute_synaptics_rc_command(struct drm_dp_aux *aux,
>  		if (rc_cmd == cmd)
>  			// active is 0
>  			break;
> -		msleep(10);
> +		usleep_range(10000, 10200);
>  	}
>  
>  	// read rc result

