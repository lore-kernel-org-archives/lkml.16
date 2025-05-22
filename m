Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FC7299AB6;
	Thu, 22 May 2025 15:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747929505; cv=none; b=pdro7jvkQ4V/YnsBpNLd0X+48Ic2vxhRVPNfjfdgUh7LO8ZZItToJW87ECRRL9A5QctX1PUlOZiXHwck1yo/CHtVX2srYxfhQlT0JyUpIBlSamPeuYwY66rS7CoHC6JZDC0DCYP/MuB2mcPcSL6lORD6VxM48NUljEZ2jwrkJuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747929505; c=relaxed/simple;
	bh=BB4KFlh0bhgkgW8XA9omWkSv3devvqubgk9nT8FDFp0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MzFIn/VwxPzhWGQFelM4/uiyQH93ZPcLFiM3iq7miGBTH/kjIaU9CSBgWhycQFjY818MTPUEWYDnFV0RWsDV6ROwnKb0QcpZ3KsFBYR4I7qT1IwNZXm6ujPsXd2lPqPZAamRWgmhxY+qCmnY2P5xIWW0tUuJ+ozQvoHxDKB+JKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c/Y0pKD0; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c/Y0pKD0"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-736c277331eso17148b3a.1;
        Thu, 22 May 2025 08:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747929503; x=1748534303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BB4KFlh0bhgkgW8XA9omWkSv3devvqubgk9nT8FDFp0=;
        b=c/Y0pKD0zjdLnNjMlSUrgsMkcA+fMiJsOIZse4pP906T209WRuWlzRbWNcSy4gINbQ
         xlBGRUv6+rIoOoY2DHbg54M8iLXuw5ia/JemjpIUoWf5FPV3z8XMkeqlByjbBJgoF37h
         wCcYOUtZ13V+e7cuHaxrAbasJfGR72DzYSUwX5D767XoYHDvTMWCFiaHqsAAgQeq1Ry8
         6ObvoZdcxK8TYZComKWp7O00MBffGCDHSq5n65bULfW03H7kkbGpbgzfvAr7AIV84VD7
         YceY/ksw2iayrCG9L7WW3+61F3Vf8YVypPp4zIJ02iYnwL8d8F83gl4YbgSiUfr9DrXp
         V89w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747929503; x=1748534303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BB4KFlh0bhgkgW8XA9omWkSv3devvqubgk9nT8FDFp0=;
        b=f/tCFvbwwsNQrc+ItAwrJUxPqzRI90sQhbIsOpldx+3b8Wefdtk3RRVku2i6ydPQa9
         5boZlMXj2qD2XSBOh0yoEqv8VSd08m5dG0DzCXPNAAvSdLZ+7CxlOkgQz523FTwm0Y6z
         SXA4P3n4KHVWqkIPQJSbOYnho7sSjEXZb3cm50RVAErmFLm8sfhFp/Hdd0b1LenMxyqr
         M97XqMia2du8YrFePEr3LiEhmJYXoEK3RjNh8LxANVcX1hnyRDIPgkxFIw0eRpztRf0k
         XCByfmjzijGwS4BEaNs06Lcs8aKxSt6jt7jUHl1H/zcW9wXQt4V4jg32TWK9zW3tgEAG
         2RxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFx+/PDsuP9919z3XebYQlJRqlWXxbejMeVGh9wrHdrUayvkHX6bxE1cVLG5WgkkLLSihFODtz/fzooyUF@vger.kernel.org, AJvYcCX+Ce7xY2l4kWFE0BPNoSB2+tDIoo/Y+qaqo/IT3wHsLjgqxcyOA0MPTyd8zZ2uyjHxx9JwhKW4du/h@vger.kernel.org
X-Gm-Message-State: AOJu0YwHtdUOc4MtGP6SJYYQtiWpYh8hM1OzJczlF9tdMV/0xndYKaxr
	JsAMjCPRR4sPdR2fbtrVznECM9c/NbOCoY6AUjrtKeNsT8Q/hynrGS0E
X-Gm-Gg: ASbGnct8qeMYLD2GU3JzFGgAzXr8TEkHJZc08Tjn3i2rY8eDx0X+WjkV3Muft7sy6PZ
	ZrscjGo/1qmnp4cZNDm4HNimfJpz40kEo1WNlK4znX/zI4rV/v+dUbdEdzKvxncPTKYWJyHzC35
	o6k74KUU37Io75TGItjd0Irbfl5SkgR2YJC1mUrQG5uG01lbWxo8Hl0T3YZTLW48UaRSv2J3jcw
	EhlT9N/cS2ERf5V+C949lYZqLhTMw7fgLzlXBNc1V9jJ3Tiu9JrfWW+/6UciG5p/bc0CPafgGt5
	x7xBLlrJzCc2qJtwGq4aNCeuuaYdmAKXaFbl9NPWgu2NhHmd1ZyXSpTZng3XMT3joel3UO40avk
	XSiaH0zP7IPFT9O1XgorD453THUnhwrg=
X-Google-Smtp-Source: AGHT+IESwpcyiBmZeMRuG7y0onny5op9blFiTJ4dV+zfpA1q4L4gKWFoThtSurxRUIxpYjTpRofNcw==
X-Received: by 2002:a05:6300:2189:b0:215:dacf:5746 with SMTP id adf61e73a8af0-2165f87aecbmr35304737637.19.1747929502440;
        Thu, 22 May 2025 08:58:22 -0700 (PDT)
Received: from wig-Precision-3660.. (125-227-154-99.hinet-ip.hinet.net. [125.227.154.99])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a982ba69sm11829910b3a.91.2025.05.22.08.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 08:58:21 -0700 (PDT)
From: Wig Cheng <onlywig@gmail.com>
To: conor@kernel.org
Cc: robh@kernel.org,
	onlywig@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: vendor-prefixes: rename nutsboard to mayqueen
Date: Thu, 22 May 2025 23:58:08 +0800
Message-ID: <20250522155810.3414273-1-onlywig@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250522-difficult-yummy-84376495b270@spud>
References: <20250522152220.3408999-1-onlywig@gmail.com> <20250522-difficult-yummy-84376495b270@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Conor,

Apologies for the typo. It's been a while since I last used git send-mail.

Thanks for the clarification and guidance on the rules.

I believe the nutsboard prefix is no longer in use, as the related device tree files were removed from mainline starting from kernel 6.1. Additionally, we have informed all our customers to upgrade to the new hardware. However, I appreciate your explanation and will mark the old prefix as deprecated instead of removing it.

I also have a question regarding the new prefix. The reason for this change is that we’ve developed a DRM driver, and the platform device in the driver uses a compatible string referring to the device tree. Without a vendor prefix, I’m unable to upstream the DRM driver because it lacks a valid compatible string.

How should this situation be handled? Is it acceptable to introduce the new vendor prefix first for this purpose?

Product page:
https://github.com/MayQueenTechCommunity/PIXPAPER-213-C

Wig
