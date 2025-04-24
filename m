Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C62C1C84A6
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 18:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745518008; cv=none; b=UhA4qFuIqYQVCo/7nigjteNeDkQpNSnxnMskXrqDYFSjfJP0pBvCaG5n5OtgUta2XNFP78RcYPMvhtC1fi6U4pL60y+YrM63VgiEVOUowUyX/dCbk2pA9Gx6+V3CRDRKx7garWIY/SMiYEmk7USkH6vzdIkJ56hwzfFA98Ingu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745518008; c=relaxed/simple;
	bh=untB1HfxdttzA08c006z9zXZeD1RPqW0OBieNxkwux0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SVxRn96eUcGaN/KcEIxMrugixXJRqf9fGeJyXHSAgpwIDajf7P+d3dFCEoamc1k3dmzdL59kHtOYoXl3T/cS4mXB0Q7Ak6l2pBVLxip3t1QcLcQLmZQg/P5rfmwH0QO+WbPjLQc7RisdORI73NZlY5gXi4F6nhtkqKVm9VqlVrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hdjw8YZE; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hdjw8YZE"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e5bc066283so2448243a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 11:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745518005; x=1746122805; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79YUOYWksfzgC8uh0zT0ugM7BA9V6bWBg5rPe4V+dTo=;
        b=hdjw8YZE5VlZpD+ayDat9vQw3wyI4dYvZyNiXACLwwpnNHIKJxpTSxrFh6IkxsQrVy
         ihTAPhZDIU4k4REqzg8QRXKGV1MYYYRu0nsQiTJs7bWeu3+eu4YjMMH91/i+4GaFnxA1
         MjOJPLxgTcyR5jDvNdzfVDW3qpkSkyd4d0kdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745518005; x=1746122805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=79YUOYWksfzgC8uh0zT0ugM7BA9V6bWBg5rPe4V+dTo=;
        b=pExMfc32HZOEVH7/Fru9Saw2oUPD7iFcdaer6clCfopr3pcTu9ERVESoqnjwNWKvkG
         +p0sA/U+LuBF0HkZVckdCX0YIDxxiw7rLMBjjEfUndLuo7anHWgeXforFvDU5TCfr6jN
         6EBIOcV1a9Zxl+/JLuE5mm/Uek8Enst7pNAI0b5drD4O/qpqMFzNzguyT9+yR3LZCMLG
         CgDlwKSKF/tfjZwQmC3p/RtKGg6EYjKoewwRwxen2TKeAfSfxu3KhJxd1BVkaUaedKLa
         axqBg2pj26l5OtuczgxPy9dZAMLPL51XNMr1eJRtetvy+dWegD9k+79M4f5SAoTC2kCi
         kiDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUY41O1ave+jdLEW8VeOgCxU/2TPuSqP26qGMCt3SWytCDzkxebWImKXbqMeqOTRl7LnDJBRekB2H+xTK8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXGuCBXjJcRSQHWSXY4wYfo3fP1aRlp7xBZVtfYG1zsY0+QrCv
	BuPOA+DcSTIy3zJb4sWDVnm3bTQtkyF3hLMpbtuA9t0ECAhJE3sgYnAlzGLcD+hXklwlfzxxju5
	5i9GxJjMLZgKIZXApqpvtRH3lmiL9OTtlfD86
X-Gm-Gg: ASbGncu6nIHMuENu5YZ270d/7TaB5gecGBXZQVDQ/NrpZSr2K915ZkGalEWhHw09klp
	ZE0jq8/zZ6jQ3v5n7A1fre4ygYUf5P7q4Rwrr10Q2CBjnCdzU0RbupmHiGf8izrqr88GK/60L1E
	WAB7RbKeqvcTVgfkDHYlYkGjbHnNSpnenqOA==
X-Google-Smtp-Source: AGHT+IF6FQyepWuw62uvlYv2AGGX4Zv8U5nVTUi/6CHfAtsO8E+E4yT2kriSnwOZ8ZJ6GbcVBIno2hzh0DlHbPq70sE=
X-Received: by 2002:a17:906:58c:b0:ace:6bfb:4a11 with SMTP id
 a640c23a62f3a-ace6bfb4a1fmr32847066b.24.1745518004896; Thu, 24 Apr 2025
 11:06:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250418124718.1009563-1-jaszczyk@chromium.org>
 <20250418124718.1009563-3-jaszczyk@chromium.org> <20250423140913.GA360030-robh@kernel.org>
In-Reply-To: <20250423140913.GA360030-robh@kernel.org>
From: Grzegorz Jaszczyk <jaszczyk@chromium.org>
Date: Thu, 24 Apr 2025 20:06:33 +0200
X-Gm-Features: ATxdqUHIDmJKjHZA9jZSJUkUEpsm0-XwqBkvekQ7zCBPFtIo1vYXDrTfrqj0M3Y
Message-ID: <CAGptq8GzJh38349ZZpEOw9sV8ihtJMHqV=PH9WUbG-C7b0tJjg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] x86/of: add support for reserved memory defined by DT
To: Rob Herring <robh@kernel.org>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	saravanak@google.com, dmaluka@chromium.org, bgrzesik@google.com, 
	jaszczyk@google.com, ilpo.jarvinen@linux.intel.com, usamaarif642@gmail.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, tnowicki@google.com, 
	mazurekm@google.com, vineethrp@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 4:09=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Fri, Apr 18, 2025 at 12:47:18PM +0000, Grzegorz Jaszczyk wrote:
> > From: Grzegorz Jaszczyk <jaszczyk@google.com>
> >
> > The DT reserved-memory nodes can be present in DT as described in
> > Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml.
> > Similar to other architecture, which supports DT, there is a need to
> > create reserved memory regions for such nodes.
> >
> > Additionally, the x86 architecture builds its memory map based on E820
> > description passed by bootloader and not on DT. Since x86 already has
> > some DT support and allows booting with both ACPI and DT at the same
> > time, let's register an arch specific hook which will validate if a
> > reserved-memory region passed by DT is valid (covered by E820 reserved
> > region entry).
> >
> > Without this check, the reserved memory from DT could be successfully
> > registered, even though such a region could conflict with e820
> > description e.g. it could be described as E820_RAM and could be already
> > used at early x86 boot stage for memblock initialization (which happens
> > before DT parsing).
>
> Sorry, I don't get how it conflicts. Wouldn't the E820_RAM be registered
> with memblock and memblock then handles the conflict (or should).
>

On x86, early memblock setup is performed by e820__memblock_setup()
and regions which are marked as E820_RAM are added to the memblock
"memory" type and such regions can be later on used for memblock
allocation on early x86 setup. If memblock allocation is performed
after e820__memblock_setup and before x86_flattree_get_config,  the
reserved region described in DT (but described as RAM in e820) could
be silently used before we scan DT for reserved memory regions.

Additionally there are more reasons why we want to make sure that e820
reserved regions are in sync with DT reserved memory: resource tree
building and setup pci gap based on e820.
On the x86 resource tree is built taking into account e820 entries
(e820__reserve_resources()) while on other arch like e.g. arm64, which
relies on DT, the resource tree is built taking into account
information from DT(request_standard_resources). Mixing both on x86
seems problematic and at first glance could be achieved by e.g.
patching e820_table via e820__range_update so other part of the early
x86 kernel setup such as e820__setup_pci_gap() will also not use
region which is described in DT as reserved-memory. But it is not
straight-forward (initially I've tried to go through this path) e.g.
it will require handling DT earlier (x86_flattree_get_config) but at
the same time x86_flattree_get_config relies on the memblock being set
up. Therefore it seems that making a requirement that the e820
reserved region should be in sync with DT reserved-memory on x86 is
reasonable.

Best regards,
Grzegorz
