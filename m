Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1935884A35
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745944029; cv=none; b=hZYFonmi1kfHLtOnLGFxrXKDBdZgYyrjKqlNm5/x5VOEroNWTnmhO90wAZP4ZjvlTUH/masiAiM7kjiXhbNrZiFq59/0WeRapkpMRE+poVIAl/gcvw7pRpifIVpxXB9G+O60rPhcErlQZ2T5gCimJwAmQMhsGbiL/+mTzSpe0ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745944029; c=relaxed/simple;
	bh=kaLvdVXI1hoIB7qsGU1EH4dSOo8/D3G1Zuff9ZzKVq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DVvKoaWJcyYlmpmFIPnWPxY1u/4t++GTYGwBmsx13zSUU0LKlgOU3I+bluaHH8u0Ec2LOkZxQCccpqVWmANplageH4qxzmETl2r0Xgdg/AZFcehOWiIGHF34QifWHHQZnS8b62mnAZzkVoBhjqaOo7nTGUksJ3rYoy1ue6KbviE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=D7k/zvM6; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="D7k/zvM6"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-30828fc17adso6244740a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745944025; x=1746548825; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ID3Zt/kcyvy5TQaBJIv/XJ2QG5FvCfrPnhdLxnIVAHE=;
        b=D7k/zvM6SKCKv3ijV3/sTCwuFIeExKb2Ai5OEmF257llwDcyUXOWrm3vL+pIlimQnu
         VTEckVqXMpokwJ812jEyaftXSx2Xs8w+ebarmaWbwEOcVjDOZtMGGl+nk2mCnQxh8mCl
         mtxCIpU0IYixiPLUeX5lvxMUb7ipnSOr5iOfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745944025; x=1746548825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ID3Zt/kcyvy5TQaBJIv/XJ2QG5FvCfrPnhdLxnIVAHE=;
        b=IdE9bl/+bOEIN/n6AL+WeZwmDINKLA82THKmhP4EE2A12UClQqqHB2/ZdbRcacDHG3
         9N0bcc3B6UO2gi1DjjHssT70s+VA5pgDVIsKLjfUzrzuYhs6Vc7sDGWac4SCF5AZlkN6
         /dn3EZmTXkzi/e56NcfvaPyk3bBotwRqScSgx0rD5QsaJfxjptU+K2M989hzhTXZTP2F
         rZ7Cpj6qjLnqclKfWhE3krCchlXH9dsdt4A+eGXFoyFw+rHIeqEWHWw2RDHbOtvYCt9f
         uKfzpknbsmhWXcVWidLxU66P15uTt9+R+z/KNAlFOwiFpfP4pbM6WyEDl/n6+lRs2vgY
         +gSw==
X-Forwarded-Encrypted: i=1; AJvYcCXgMAak5Jn2XfkKDrcx94IteO/DAKPo7FB9SCQYPGDacpqaDjEvOpRcbhgGpGJn0q7DB36v/13NRcumIrU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJCMnM58LB2u7rHv9SuLGCgNZpGCkTiacJupknkcWAJMwGvCkH
	Gy46TJphPVl6impt8KzDh0W4WnQfIoVCTsHJvOEI5+uepC4S6imiDEbyQutMoiTbqVp/J84XXG8
	=
X-Gm-Gg: ASbGncs+sqPJVolBHPgKqjpRS6DJbooP1AJgJP3kTYHuA+vpa2QMYKSKwlSuKT5et6p
	3/wSKNabK+pZ1q+nEbo9G51jtwdy5iIfD26AZcdChK9QiUQptMUQcwu8srmUFGQ7mmMYNn36/Ov
	1adFT7kbte0Ia1f/9W+hNLUJSQI3Ro82iOWfud6jDq6ARmMzF29b/HJw7GFXQ1h/orapIYodHC4
	KvNUI7Ul5IJzGCGEGudZGSTqqs+FVqX2aSOhZ6y7JWqOjTV8+VVTunuz7rRGtre+NWxcy8d+E4i
	sfyJFqjtFeFOK7a7nqrWZE+Ltoeg9o/G3/zb8ospykNUn9EfYwmYZQCJ/bzZuiphhkavHe9Euak
	Li0BQwsJg
X-Google-Smtp-Source: AGHT+IHA0OwYH6kKViJXdVYL7RdKnBTgSJmtN4o8/UgmAfyB5AZ74yhOeHh6BHHO0Rx5VFlzz04qRA==
X-Received: by 2002:a17:90b:53d0:b0:301:1bce:c252 with SMTP id 98e67ed59e1d1-30a0139879cmr19930778a91.27.1745944025363;
        Tue, 29 Apr 2025 09:27:05 -0700 (PDT)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com. [209.85.215.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef099963sm11426180a91.29.2025.04.29.09.27.04
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 09:27:04 -0700 (PDT)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b074d908e56so4641597a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:27:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4v+dgRbrBB2dEOIihx0a1lby3u2zqn9OrfOnJ+xyLF/rHtmUJrzmjQdJe7Hu2D3m6uZT2ZUAM8KE+f+Y=@vger.kernel.org
X-Received: by 2002:a17:90a:8c15:b0:30a:255c:9d10 with SMTP id
 98e67ed59e1d1-30a255ca186mr3202709a91.8.1745944023558; Tue, 29 Apr 2025
 09:27:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429092030.8025-1-xiazhengqiao@huaqin.corp-partner.google.com>
 <20250429092030.8025-3-xiazhengqiao@huaqin.corp-partner.google.com>
In-Reply-To: <20250429092030.8025-3-xiazhengqiao@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 29 Apr 2025 09:26:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WtRYCM=tzfyfLD8Yv015U2U=tuRMTsSLtxNSm9zAia8g@mail.gmail.com>
X-Gm-Features: ATxdqUG2rAf0BoOyLmWMpcSnfq6hQrouHip_k1QAJOJNtZxAX5VK0S8UBRBj9Mk
Message-ID: <CAD=FV=WtRYCM=tzfyfLD8Yv015U2U=tuRMTsSLtxNSm9zAia8g@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drm/panel-edp: Add support for BOE NE140WUM-N6S panel
To: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Apr 29, 2025 at 2:20=E2=80=AFAM Zhengqiao Xia
<xiazhengqiao@huaqin.corp-partner.google.com> wrote:
>
> BOE NE140WUM-N6S EDID:
> edid-decode (hex):
>
> 00 ff ff ff ff ff ff 00 09 e5 73 0d 00 00 00 00
> 32 22 01 04 a5 1e 13 78 07 13 45 a6 54 4d a0 27
> 0c 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 03 3e 80 a0 70 b0 48 40 30 20
> 36 00 2e bc 10 00 00 1a 00 00 00 fd 00 1e 78 99
> 99 20 01 0a 20 20 20 20 20 20 00 00 00 fc 00 4e
> 45 31 34 30 57 55 4d 2d 4e 36 53 0a 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 45
>
> 70 20 79 02 00 22 00 14 33 d8 04 85 7f 07 9f 00
> 2f 00 1f 00 af 04 47 00 02 00 05 00 81 00 13 72
> 1a 00 00 03 01 1e 78 00 00 5a 4a 5a 4a 78 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ad 90
>
> Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com=
>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[2/3] drm/panel-edp: Add support for BOE NE140WUM-N6S panel
      commit: 800c2180705a87829f7833df3d9e73b548bf65ff
