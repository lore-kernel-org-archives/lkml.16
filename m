Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6885B207E05;
	Wed, 16 Apr 2025 18:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744826545; cv=none; b=rGGIBwhJP3DYbcuZb2c6DXsEpk73uunT6zjOqPd0qV8nYz6ZWIvhZk2r4xrKuTm4B7F5+bEpl926wDkoyLLgKZ4mf8wTkxUS0r6YHRgrnDcXgKGdR3Xo71qg42xDpB5jZDvHJuaWm0IFhrrhEBz/oapJG8KlpElLH3Vomkt3dy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744826545; c=relaxed/simple;
	bh=vtB6zUEEeHZNjEIpXtLNXtBJZC6h6WkFyfFEeJpFG3Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qAqRDaiMKj3IEo8ntGtOQ8kBC2e5b1c/I/KQtudT5UPQx9TjUEy4+GqdvBES9Mqz7QasYFbi6yMW6zICVhGw2wFJJ+RgPo9/DTfqc0sji5OfNoR99YGsel+qRL3T+vUhoJjkZk+TTZIORsxBtY4z1oEbBOAO380qrKTisYxuHbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+ICGGzt; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+ICGGzt"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e70ffaa20ecso1718078276.0;
        Wed, 16 Apr 2025 11:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744826543; x=1745431343; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vtB6zUEEeHZNjEIpXtLNXtBJZC6h6WkFyfFEeJpFG3Q=;
        b=O+ICGGztWQDv0ERcEBR18Z4q5aHd/tbI24VSTp5XOfS/iM9TEEOo/05wEjj4jRbY7X
         fwvShac2h0B40o4EjHyhYQBsIvqxL+HrQUga/woVM5RVjvtb64/9QI7aYHeYqOnMmWwu
         4uzohFTy/VrTrvIM4xsSQH3hiJROe9WInSlQf9v5OlDiw27sjUgy+NRNt6a0HTIatW5J
         AFeRclZB9msZKm/WB4uIDae8kFYJo++Rq4RNro3iZ1cl0RTN2POjc52YMVg6w5jp0oIt
         i8RfAygx/j7s4WVeRWQ/h1CFEe+Ozz/loi+jm/IzbvBUBW0wqVd3FAdcXsveRqMaij8d
         EaTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744826543; x=1745431343;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vtB6zUEEeHZNjEIpXtLNXtBJZC6h6WkFyfFEeJpFG3Q=;
        b=WRRx+CCwvesffGHmErgQZEW9jTgC0oPG2we3DbMq+wlZx0Jk/NZOKXAaT4Pz3pKPEP
         RBFFhtDA2RzXSAuK5/YXTKsJmhUoG49FL1InGtjouGUxGc9bbPBAmKr2ggpCiNX7OVCS
         4Ouract+osaI3/nV2DppKP5QA93PeseqCiEFUfaxBQ2MH8Kq413NzqCgb0wK9ySuv2Mi
         fUnjx/0oBQnOacXULxIM74wDxPWZD7ozHTvNniQdWZvV9/0yb1rSd53vuVl4oL33XPMT
         8n2CeOvPz0IW9IlWbsMBmQvaZi+wPcaspLfNtJmdQsPqPaD61B0QIUqR17rrfUFuwXwx
         l3iQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNhnXacbIOtq1V/XzFkJunx7bLm9KM+INP4Fxic3M/+HYJQlvWopG9Dje+/QzwPKIgX+0B23yWQ6aT+AXp@vger.kernel.org, AJvYcCVtD/AXGPL3jnuYr2oewzrmKGDgLl+QYtylPqKh2inKjmwdHpLi5+voghQLZ8Ej64kp7WveqjWrfqyS@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8BvakjKukVquUHJvLVaiqxld1bYwVizRUWGJgCniSUlvDi4bk
	na+RAneczjQM4UfS3CPYc1/0VRZBVN4E81u2+NW8HvUPDaQeBAEnz4CQ/3sNJl0Jk6jFE1LuDOh
	YFre7wfuy5oNsQHed7ikdTwQm68w=
X-Gm-Gg: ASbGnctI63SI51QvzO5OnM3n3WE52r2ggNBHAX065blffDpua4gi+Nps2ejJ1PJWWKm
	O+QodeCEN2WGmpOVPGMvm3WKKwEAjz1N4f9wdi0wVPK/5cHjasgztbiyNwAuiShfJjue1ndgR+s
	xpl5KvhvgmY4N+ozrKb5yrc5M=
X-Google-Smtp-Source: AGHT+IF6nv1Xwxa6/kuzoRUSeR3L5USo5Sfhi95vX8nH4+whJCLi5evTvDN3X+ES0OGn9kkZQBtbUmpklt5Jat9tfs4=
X-Received: by 2002:a05:6902:20c5:b0:e6d:f0a6:4cdc with SMTP id
 3f1490d57ef6-e72759971f7mr3697408276.20.1744826543082; Wed, 16 Apr 2025
 11:02:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404191144.4111788-1-william@wkennington.com> <174407489947.454798.15613957607681427179.b4-ty@codeconstruct.com.au>
In-Reply-To: <174407489947.454798.15613957607681427179.b4-ty@codeconstruct.com.au>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 16 Apr 2025 21:02:11 +0300
X-Gm-Features: ATxdqUFQBsIrXD1qfRD11uxRSlG3C7oV5i-4OGCQWJVC6SAnP6S24OSDnGSxwfQ
Message-ID: <CAP6Zq1h5eLvJkP78zyvR_bsQVpGRtmcfjFHHzjrXirtddTpD8Q@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: nuvoton: Add MMC Nodes
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, "William A. Kennington III" <william@wkennington.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"

William, thanks for the patch.

Reviewed-by: Tomer Maimon <tmaimon77@gmail.com>

On Tue, 8 Apr 2025 at 04:15, Andrew Jeffery <andrew@codeconstruct.com.au> wrote:
>
> On Fri, 04 Apr 2025 12:11:44 -0700, William A. Kennington III wrote:
> > We have the driver support code, now we just need to expose the device
> > node which can export the SDHCI and SDMMC properties for the 2 MMC
> > controllers in the npcm7xx. Tested on real hardware to verify that the
> > MMC controller is functional with filesystem access.
> >
> >
>
> Thanks, I've applied this to be picked up through the BMC tree.
>
> --
> Andrew Jeffery <andrew@codeconstruct.com.au>
>
