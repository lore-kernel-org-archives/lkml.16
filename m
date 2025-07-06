Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA73D202F67
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 10:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751797679; cv=none; b=eWhAzxHQFbgqfS8Pkv2ZXA//cSEQyf5wT7rTOVjrXm3oTUJxDn/mKiNnjKM93b7qE9HOu1jngipogqI0lopfA51H+0kA4HsDeoAV/QajosXgRgoghiqbSdWjBP1Iu0NMUBeHokxj8tTY9BhDOKv9MGrmJfHLu+TnnpxKiMduhnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751797679; c=relaxed/simple;
	bh=9K+ZlIV9VyTnpA8DmHWdooGPTnN2QzCix4/ezMftv38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kLw7T1HOklWs/wmeOnNKWPxRuiQYCvosozirn62i7dGnHqykIitHtTf8D6PPJ2ANw+SV+ytNoACRvekENLtKmC87Vzvkj7LbGvLeVaujiwgF3tevK7YG7V1TmJ2iosxhmPJx9rs6rqttZDeJEhu1OpsvU0mQZP8Tg/kNjqYq1bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5331f409ed2so617842e0c.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 03:27:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751797676; x=1752402476;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D5qeoi1n24XfufXve0BXfIa0gWLLUTNel49/JF9R7Qk=;
        b=S4SHZfEPOBq94YaWwZofgWld3uAB3WovsD/7KhQWfAg6EYWdtTz7BSJ2af5MdtGek2
         wMHqZ7eZHsWQ37VvEBiRkd39GAQfusxe6QgGcrdrwzu9HuZI0Njio+rQiJSWYkra2JI1
         qyzu4TFPvOiIF0YY9lHHpZPqNbnmiuVb9fCZii21B/6x4tQIxIspER8gYDXG/TFc7Y9b
         tSHApLiIVru3JtrXYMrafwV2Imvqp8Ooppe6cL9nu+F+42LtdetcLnfgTEZoeI4QuXEv
         A6zD6t8P1+i3ICOX9YURiCvikZm7YlW+XL0XjinwPKWrreCktwsbknUQ01so2ANgG5Qj
         oS2w==
X-Forwarded-Encrypted: i=1; AJvYcCWDVJoL/e4v8SSkN57XUzOXs6bo2vsnzlbWaQMNklzGMuFfkur2fzN3M70xfvE+Ny5kvD2IYrnp0vB49bk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmyju2DcttpAYj51NB7n7JZlkLtwOq1QojbpWwmsni5a77K8Qx
	x29Mq4lKUfFuHq43KH8xNlLileFwWD3CZYC/mNT+pzF19ChAPyw3TODS+s5VCQTQ
X-Gm-Gg: ASbGncuhPUccI0HJInWwRPKKySmCeQM7ndEBpjDc1oMRnP43XYT1LMrplJVeYuUfJFW
	hJF4F9kTt1W0o/K1A3AO4nfdTT/v8lOq7O5K5cvXiWrlxAZhigys8tWez9gu2jz06hRMbfxopva
	Z59m5XqhKuRIsHTHneFcuXT0MwgDF+wA7x0Qm2ZiPFgfKPQ0od7O5/qKfaXDamdAcVYdrWEHC9I
	BBfFJ2JeFiyHye4Yvu0iNY3AWVotfPLsQg2kULOsm7xUVVzNBiM3GjBTBp7PReXFvdQ/3/4OAEt
	8fZiCyZAQFyFXdhVU0iFbT7sNA0/LuTsOutJ/PaRzt/Hsx+qbiR8PcmpzdjeJ8+wmr7n15VZ9Y6
	DDZNkJdRR/IlVVV4U9JoZyWc2shvK
X-Google-Smtp-Source: AGHT+IGbJVXDBZ9RW6cEeypalUkj9WJKeBLcke57uRRWVl0n51/wJqmuv+8yfViZ9M0ztVak1onkmQ==
X-Received: by 2002:a05:6122:3548:b0:531:2f51:7676 with SMTP id 71dfb90a1353d-534f66772camr2699157e0c.9.1751797676269;
        Sun, 06 Jul 2025 03:27:56 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5347906c3e2sm882191e0c.29.2025.07.06.03.27.56
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 03:27:56 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5347686c12cso552178e0c.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 03:27:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXNOAb7CyxXrA5N/+piPYYgzhs3oy1Kt+CYwemTc3uWFPEvVcoaPiFmsrCwLJOARZ+tYe7pXukPfW1dz3E=@vger.kernel.org
X-Received: by 2002:a05:6122:2522:b0:531:4041:c4c7 with SMTP id
 71dfb90a1353d-534f6647ef7mr2383299e0c.7.1751797675864; Sun, 06 Jul 2025
 03:27:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1743115195.git.fthain@linux-m68k.org> <ec2d443d3c3213028bbbab7c2e0382cd53db75fe.1743115195.git.fthain@linux-m68k.org>
In-Reply-To: <ec2d443d3c3213028bbbab7c2e0382cd53db75fe.1743115195.git.fthain@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 6 Jul 2025 12:27:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXqZ8AVgx7i21PWQcv6MCCfv8nN+g3c5VieAAr_vB6qSw@mail.gmail.com>
X-Gm-Features: Ac12FXyDnW8Qrbd8AeQfhiv1PJDIJ_HfDyd7HbCagdBx1CNeK_YtloNRAxfCHtE
Message-ID: <CAMuHMdXqZ8AVgx7i21PWQcv6MCCfv8nN+g3c5VieAAr_vB6qSw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] m68k: Remove unused "cursor home" code from debug console
To: Finn Thain <fthain@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Mar 2025 at 23:44, Finn Thain <fthain@linux-m68k.org> wrote:
> The cursor home operation is unused and seems undesirable for logging.
> Remove it. The console_not_cr label actually means "not line feed and
> not carriage return either" so take the opportunity to replace it with
> something less confusing. Rectify some inconsistent whitespace while
> we're here.
>
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.17.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
