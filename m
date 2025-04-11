Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EB922126F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 10:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744367876; cv=none; b=VYiEohE1YNOjVzpyZc287/lesqkyTmI9nIjteZeflHn+ZB14lClVoTfcTP5Yl1YkdPDGV93xe05q4ZDQUbhaFZ17tY2EU4TgguLpMzVFsN3zPzjK1u5cxJkW1NpMyNnkqbtuQLcN1ZlvJxAocVan9OM2N1BUdyt3/EMQimOggsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744367876; c=relaxed/simple;
	bh=OlLhVTTqWwTBNjngeM/UqJrVFZsmAFzsC5kCdagQ6p0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aQL03u0FUlwp4VoA/3VPb+rGTKX1m9y72hZ2JTd4AXtlVkGM1WYSz45bmduX+ojCUVbvREL490+Osbrb7nv775PgxMt2dP0bMk8Qs+Zg31ZlTcTbcwRSJON3U+dG4aVuqbjkNyvXmoqHOldcT3tQHnWtpAsozi/dux8rA3Cgj3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JM3sOmqi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JM3sOmqi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744367871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=OlLhVTTqWwTBNjngeM/UqJrVFZsmAFzsC5kCdagQ6p0=;
	b=JM3sOmqiG6PgpJblHzyCRKWEOhwNycpjsXLpCI94pZMa+XanZzrFnyVt7fIeCzhmlYkhJa
	tA4qVsUBINx0zzRiBVy0d6UlBIjsApr31a5Nj+O/lYwcbGjXpGuu9fh8BsEU4UzaTmbiJm
	uHJoXGhkEvn/uVeg80wjSebXU4qvUB0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-216-eW-g1G3GNbqk1hxe1Eon2w-1; Fri, 11 Apr 2025 06:37:50 -0400
X-MC-Unique: eW-g1G3GNbqk1hxe1Eon2w-1
X-Mimecast-MFC-AGG-ID: eW-g1G3GNbqk1hxe1Eon2w_1744367869
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3912d9848a7so1496469f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 03:37:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744367869; x=1744972669;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OlLhVTTqWwTBNjngeM/UqJrVFZsmAFzsC5kCdagQ6p0=;
        b=lLvJ6CoXk1/YYQ09I95EPqeD5l2hn9S/BkNtDMb41pvjKI1bNpmEVFLlfUY0DHitFm
         4cAaaIpX9t1Y+wi4oTc8bn1Mfq71feK9aimpVnANaQm6sdNWhlvKpnWIcjL3WvCN2gRx
         OlslB+xyP8QvPhxHjP1JlCrUDmc4n3COMpaBgUko+FopIegAONGIEdT50bTxEOJQqGFF
         1uc6x7CcdN/Z+HnvmAJZ1W9XNAuhgDplI5Y6RtkdqmCIU06UrMHt+FS1WRNBjV1NjENk
         K5oRwdZIKAb2U1g3+RQmXQnfdd9s8v2ngQIlToKw8Ogtle/Gbh2AymU1uCh8mUaF8ucq
         HQww==
X-Forwarded-Encrypted: i=1; AJvYcCWEUgU9nQyJlwtJqALJAiibkR0w/FLXbFFR/zLQUebUGH3tfHIs0BsLrF1MMJYnHufnnLfGCYIH1pXNc2g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWue8y7cIiBiACP5gub6uBXn54dWjjSrKj/4MOhoVHmEzTM4rU
	LC0trveOejRIQiIBPNzPNc1PiN7kDEQ3ZrAF405ITRsLvUkeOUQltmyaQqIvGeCbw57H+L180jk
	bZ90tDRK0tWX7helWWQRgXL53JHtabDMB5Ls4Iw1wZWNzFBw/XSysUmwv5Pu1kA==
X-Gm-Gg: ASbGnctXqGpElPxIPvFP6eCJCgKcVI0J0roAw4aL/AnbTpudxXto2h57H9I1JZaK9d6
	FeUOuz/DrXo9scucBDODuRknf6nKAYQCaXJkBxP4Bu5ZR8V1oFwkx+NjPvMf23maUoLIKmjHcvw
	8uD3ZCJiVdFnSaH8xU8neWkbfjz4WNF8JAlFN+yPRWQluxAX7G5mx5RKOIkDxokgn2BNJQGCInI
	yl2UGr3ExaMjM0zrksI8OaYajy06xtvTvMqZBfKxr7cPpH0/bpAvG7aAvVkmOX0yPeJ9gXq8IiG
	SQnSmlncY0XUz4A27u5BDvzzT3kDd/OC+cI5Sg==
X-Received: by 2002:a05:6000:2508:b0:39c:1efb:f7c4 with SMTP id ffacd0b85a97d-39d8f4dcd59mr5693417f8f.25.1744367869192;
        Fri, 11 Apr 2025 03:37:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1SqxGkQrmtZzx93bTad8QenbXEjXeF6uEDWDfABdDgNVt3W6DDjxqe9tezOB13nGD8+rzxA==
X-Received: by 2002:a05:6000:2508:b0:39c:1efb:f7c4 with SMTP id ffacd0b85a97d-39d8f4dcd59mr5693399f8f.25.1744367868846;
        Fri, 11 Apr 2025 03:37:48 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f23572cf0sm82101865e9.27.2025.04.11.03.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 03:37:48 -0700 (PDT)
Message-ID: <46bd23c323846b1bec2400df2e87ab98abd0f6ab.camel@redhat.com>
Subject: Re: [PATCH v2 08/22] rv: rename CONFIG_DA_MON_EVENTS to
 CONFIG_RV_MON_EVENTS
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: john.ogness@linutronix.de
Date: Fri, 11 Apr 2025 12:37:46 +0200
In-Reply-To: <ecc2c812b595926f940ee93e2e34c4451544e10c.1744355018.git.namcao@linutronix.de>
References: <cover.1744355018.git.namcao@linutronix.de>
	 <ecc2c812b595926f940ee93e2e34c4451544e10c.1744355018.git.namcao@linutronix.de>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0



On Fri, 2025-04-11 at 09:37 +0200, Nam Cao wrote:
> CONFIG_DA_MON_EVENTS is not specific to deterministic automaton. It
> could
> be used for other monitor types. Therefore rename it to
> CONFIG_RV_MON_EVENTS.
>=20
> This prepares for the introduction of linear temporal logic monitor.
>=20
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---

Reviewed-by: Gabriele Monaco <gmonaco@redhat.com>

