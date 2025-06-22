Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAFA2F2E;
	Sun, 22 Jun 2025 04:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750566547; cv=none; b=mSpJ1AUbyoX9SuhaP+WSwaiXxHpXxsQBQuddFt4KECiRj7z7sXz5zt90PZhxMbeQ9VS6mEe5zBjnzRjNw37IC82BrtG3NhG3R40wGdG/Hs+yS9O2xca82C+vlkp4SQQKeHZbmAr32r2cf4W+puSMESKiYUNyNH1e/w0G0cz1F1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750566547; c=relaxed/simple;
	bh=IagScaMDEdYQG7R9P2kSib2dyoqUDnnPhlqsjDyOxsY=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=mhiDBVp04B/lA85IrpOHlBAyGPdbk8yEfX1P5HVggJ6IZkTyYWHvBirm2vmGpdtDGK4oS2F+GsnIhCdLqDPCyeZGFEHumB3p5BVsQq38UylLjFjAIMqzp2Dr1CGuF2qdjH/cd+gpTirazWtLp3bKkSkTnzPm3QWCM5ZC2NYCopQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BexUzxyl; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BexUzxyl"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-235e1d710d8so43025315ad.1;
        Sat, 21 Jun 2025 21:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750566545; x=1751171345; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HdpyOZkXk+9YOdwFj2cMizll4bcR4525E3JmeNI/prg=;
        b=BexUzxyljWiOT6NTBW0LLz1MAjCc3heyda49QhPLYOK5dWsGxb6tWStCfB2itiqMcp
         Zoh268bTryji0JbesKe8Qa9PcJ5jmsFM+B0buM6v4Nr3bRJJ8bJuZQToJGkf7ddR1Fn2
         y7Vm13bmwyBk06EhHfS156zRkR0xX5S2fNC5qPGqSmNLSo/bQurZ0OfuyUf2ZRGgUTWl
         A1N/XTH77/jzQgOQ08rY3/RL/0hg2qnP6tTS8t5rEfVgu4CdH1bMCOYUt9HK4K/yvnPM
         8f2DvhS0Cc8ns7Eq+tsJzIRkjodsWV4WrDkg9/0HlMUwrdmdmO46P5q/iW3V4TAyVDm/
         GjPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750566545; x=1751171345;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HdpyOZkXk+9YOdwFj2cMizll4bcR4525E3JmeNI/prg=;
        b=cOWrSj/P9jOZ+YupKs3lQd6PdVHq4hteveNkO53N15KVusr1jtx71iI5/LV64h7PFR
         O8+VgKlW0gbKOYm4VO8OLwnfybokdO7TQGESbP0uF3PWxTrRY9y2SNUTeoUy5QI4VHXp
         p6+RwF8OcHEWFv0vZUijmIk9FDf6KG5wOAYkpOdZlb6zgXZCOZIi0RJz+du3H7nvxdA2
         vTkfIengnkZ+AC1Z+TqN4JIT6KgMHbp7G6hEJPwGGv8Fr4J/Y3Q2iQjgn/QyyAEL7WrK
         WnmtA7MI32JkZwWvcuFn1sGN7h2bOkGmhoVe+4jGu6CMhRD5pQxJ+LKB9daiEfUPJlWP
         pfrw==
X-Forwarded-Encrypted: i=1; AJvYcCVGc5Yc4TETrzyX1MCsy3F0HNuBk/pnqCfjss7Cu3x98oQYkR1g9CYtVJZFq7WWWXsLYOt3zM2WRl0Th4k=@vger.kernel.org, AJvYcCWQTe/lFv1cv/UaiaCoSBgjjKZECpYpYAERUj0ayj7E8z+qeuzjpjwYsbXXAEtHW1M2OxviyRcdkAFDfwFr3QMk22Ak+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4PZShM7qTLYAuP4w6mLy6tI5XOJpQ9XjoPwsuWdtiP3P086Du
	Dpjj2vKRW3vwIBHwbvTSaBQrjiNi7EIShHRhrC26Ohf/tx7GLl1Ll66qqKltLEUx
X-Gm-Gg: ASbGncuXbeAzRL9kY1H03cU11ikJMqSnwIPbMxHRNvrzs4rf93VluHGo1wt937b3t/9
	gVxFqzG00jdfR6F3gqt4S7L7StJI/7PruPOevegche7MpozocWyVPGegrUjXcSGfNYaZ+WkfewB
	n1iOyekgNhjFEyo1yHzdtE04C2bXmuCJUWu9acYGCU+pPCph52hRMde6pReojfaA/DbEBcBI8zi
	lrPqoUBr40DxBh77BeBAcaD6Ja8Ug8IpFkonyKb1H8g5lruofrqPyJumNHRtOyejLEqLdCehGdR
	0AJ7p2diMJ6P53bvAOQ+CrZbalo7I5jzX7nbKavra7rwmQda+7KwQO4=
X-Google-Smtp-Source: AGHT+IGUlypzRoG3xn36Mo4Gj00Qa+tkaFrLmP2eEsLGcTIfLac4x+JIzAMedbRc5xTB7i0FOz0zPQ==
X-Received: by 2002:a17:902:cec5:b0:235:88b:2d06 with SMTP id d9443c01a7336-237d96bc38fmr102831495ad.6.1750566545316;
        Sat, 21 Jun 2025 21:29:05 -0700 (PDT)
Received: from localhost ([181.88.247.122])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8393470sm53418855ad.37.2025.06.21.21.29.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jun 2025 21:29:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Jun 2025 01:28:59 -0300
Message-Id: <DASS1Q8GNS4V.1Z08IM0OKRY3Z@gmail.com>
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Kurt Borja" <kuurtb@gmail.com>, "Hans de Goede" <hdegoede@redhat.com>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, "Joshua Grisham"
 <josh@joshuagrisham.com>, "Mark Pearson" <mpearson-lenovo@squebb.ca>,
 "Armin Wolf" <W_Armin@gmx.de>, "Mario Limonciello"
 <mario.limonciello@amd.com>
Cc: "Antheas Kapenekakis" <lkml@antheas.dev>, "Derek J. Clark"
 <derekjohn.clark@gmail.com>, "Prasanth Ksr" <prasanth.ksr@dell.com>, "Jorge
 Lopez" <jorge.lopez2@hp.com>, <platform-driver-x86@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <Dell.Client.Kernel@dell.com>
Subject: Re: [PATCH v3 3/6] platform/x86: firmware_attributes_class: Move
 header to include directory
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250621-fw-attrs-api-v3-0-3dd55e463396@gmail.com>
 <20250621-fw-attrs-api-v3-3-3dd55e463396@gmail.com>
In-Reply-To: <20250621-fw-attrs-api-v3-3-3dd55e463396@gmail.com>

On Sat Jun 21, 2025 at 9:04 PM -03, Kurt Borja wrote:
> Move firmware_attributes_class.h to include/linux/ to avoid hardcoding
> paths inside drivers/platform/x86/.
>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>

I forgot to add:

Suggested-by: Joshua Grisham <josh@joshuagrisham.com>

> ---
>  drivers/platform/x86/dell/dell-wmi-sysman/sysman.c                  | 2 =
+-
>  drivers/platform/x86/firmware_attributes_class.c                    | 2 =
+-
>  drivers/platform/x86/hp/hp-bioscfg/bioscfg.c                        | 2 =
+-
>  drivers/platform/x86/lenovo/think-lmi.c                             | 2 =
+-
>  drivers/platform/x86/samsung-galaxybook.c                           | 2 =
+-
>  {drivers/platform/x86 =3D> include/linux}/firmware_attributes_class.h | =
0
>  6 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers=
/platform/x86/dell/dell-wmi-sysman/sysman.c
> index d00389b860e4ea0655c740c78bc3751f323b6370..3aec09987ab145508ed05b02e=
61a6d94edf79484 100644
> --- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> +++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> @@ -12,8 +12,8 @@
>  #include <linux/module.h>
>  #include <linux/kernel.h>
>  #include <linux/wmi.h>
> +#include <linux/firmware_attributes_class.h>
>  #include "dell-wmi-sysman.h"
> -#include "../../firmware_attributes_class.h"
> =20
>  #define MAX_TYPES  4
>  #include <linux/nls.h>
> diff --git a/drivers/platform/x86/firmware_attributes_class.c b/drivers/p=
latform/x86/firmware_attributes_class.c
> index 034f9254240b048f58c97c18062db03f771f8139..af39ed9ad2836147c98b4bb0b=
89e70e96ee34b71 100644
> --- a/drivers/platform/x86/firmware_attributes_class.c
> +++ b/drivers/platform/x86/firmware_attributes_class.c
> @@ -10,7 +10,7 @@
>  #include <linux/slab.h>
>  #include <linux/types.h>
>  #include <linux/string_choices.h>
> -#include "firmware_attributes_class.h"
> +#include <linux/firmware_attributes_class.h>
> =20
>  #define to_fwat_bool_data(_c) \
>  	container_of_const(_c, struct fwat_bool_data, group)
> diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platf=
orm/x86/hp/hp-bioscfg/bioscfg.c
> index 13237890fc92002e7e730b1c235ddf068a6737cd..2df31af8a3b4ac88710af1fae=
2d5dabbb3185f1d 100644
> --- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> +++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> @@ -12,7 +12,7 @@
>  #include <linux/kernel.h>
>  #include <linux/wmi.h>
>  #include "bioscfg.h"
> -#include "../../firmware_attributes_class.h"
> +#include <linux/firmware_attributes_class.h>
>  #include <linux/nls.h>
>  #include <linux/errno.h>
> =20
> diff --git a/drivers/platform/x86/lenovo/think-lmi.c b/drivers/platform/x=
86/lenovo/think-lmi.c
> index 34a47269e3d34d2eda6b71af73892656cd2bf67d..f61a6287eb0ebe9ac4c0c9445=
c3b54c12b276691 100644
> --- a/drivers/platform/x86/lenovo/think-lmi.c
> +++ b/drivers/platform/x86/lenovo/think-lmi.c
> @@ -20,7 +20,7 @@
>  #include <linux/types.h>
>  #include <linux/dmi.h>
>  #include <linux/wmi.h>
> -#include "../firmware_attributes_class.h"
> +#include <linux/firmware_attributes_class.h>
>  #include "think-lmi.h"
> =20
>  static bool debug_support;
> diff --git a/drivers/platform/x86/samsung-galaxybook.c b/drivers/platform=
/x86/samsung-galaxybook.c
> index 5878a351993eb05a4c5c2c75b4915d972ce9becc..9a5a7b956a9f6a2738470e83c=
e93f4cccf4bf3b4 100644
> --- a/drivers/platform/x86/samsung-galaxybook.c
> +++ b/drivers/platform/x86/samsung-galaxybook.c
> @@ -28,7 +28,7 @@
>  #include <linux/uuid.h>
>  #include <linux/workqueue.h>
>  #include <acpi/battery.h>
> -#include "firmware_attributes_class.h"
> +#include <linux/firmware_attributes_class.h>
> =20
>  #define DRIVER_NAME "samsung-galaxybook"
> =20
> diff --git a/drivers/platform/x86/firmware_attributes_class.h b/include/l=
inux/firmware_attributes_class.h
> similarity index 100%
> rename from drivers/platform/x86/firmware_attributes_class.h
> rename to include/linux/firmware_attributes_class.h


--=20
 ~ Kurt

