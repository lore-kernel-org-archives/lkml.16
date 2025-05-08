Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6027287506
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 18:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746730578; cv=none; b=AXCXGwkBiI025EfmbHoR1dxCRJgQE5eX8yMD/aXzW0rEpOCsogOsqMfdvA+LpouFoWFYSkXJ0bFcm4MrpvQqt5SxCYYFl4DB3VdoulwJs1AEeNWHR8PlL7fhKqF/ZIvBaVlpFwWY+JEgXYrS8xGZGcNTfB4lvf53cBTbFeXXVrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746730578; c=relaxed/simple;
	bh=smPjj56uPub9TM6bO4FgY4hVjEudydLiJ4nhoAUsLTo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ocpny+rM+vRzX/KKJZOLViKRQlBQMZ6o0lxRXyL6VUIJdnps+K+uaiGRye8dCo6GESaZ0p+tygDBKIRwILeaCFoqsqNx8Nl9y8tQcDDmhxEV+0cTCYrH//ec0sPn2ta9CuJZ/A/+ujjncF1JFKhZDbrCMaKeAKD4SZhZdF1noTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MCbM90qc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MCbM90qc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746730571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=smPjj56uPub9TM6bO4FgY4hVjEudydLiJ4nhoAUsLTo=;
	b=MCbM90qclRljEOMvObFxCp+UoR7uRj50UbF3gq2qxmG9YDBZV8nulPNbPUBL/qmCgmlDjN
	w+QtO2i9/pd7Qp46pjws/tvxpNVdBGAHcMbiBha01N1iryf1JQl4sCXa6D0jvckuzP8Qq2
	CTl32sSW+BrNiR6HUhyH68+msMsyLx8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-100-JXSq8b9NN9y3gqj_dl_sGg-1; Thu, 08 May 2025 14:56:10 -0400
X-MC-Unique: JXSq8b9NN9y3gqj_dl_sGg-1
X-Mimecast-MFC-AGG-ID: JXSq8b9NN9y3gqj_dl_sGg_1746730569
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5f62cbc6d5cso1337989a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 11:56:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746730569; x=1747335369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=smPjj56uPub9TM6bO4FgY4hVjEudydLiJ4nhoAUsLTo=;
        b=X6jc4KnolyEpbM71zPfEsv1s5dHyraIxpP/KPL9ywXtF5VYSISHCmG/s1nUGedMCjy
         +iO/oce/DKlRq8w1oo/h7SnMsrGWekxIpVRF+yGGzDeyf/+VlgUBWnkKfEHI3Uyu/eY4
         tpReJRcSF1lImDiXppEGSWotXeRmavb56BoYyveW98mlGGHbPbmGInoDUF4eNv4pDAnd
         7zf2lmdcFPaWWs8vUFXv+jiX3dMaZpTDvm2XYlSLvyiTUQo0jEPEx5ywy55fZxEGyfzB
         vKfgR+iiSK34shTlXReWL7AcIcwwyAbvQtAAgcqbLmkf2NaHrUZrPAPyFuKJArgJrd9F
         rc3A==
X-Gm-Message-State: AOJu0YxSKEfPFfQzxmlEmdRV6esa3BxJSaaX7mErfV+n/oMokiq8nKbw
	kdH0EuTgtOYLEzulC9uVsnFpT7e0tWiuR5855RpyC492+1Uq2wV2hUHpmSHXTQR9I56o1W726M8
	8nTZBLxP9TQNpotfiv3yRKbkWGohUbwA9VyvDtbDQKeU4f3akjqXkchuRioGQ6UkGq+mjpAWce6
	fdl0BDhKRWMw17HE0tTRL/Lq5ac1Zbk1dolBhsyii7ezsY
X-Gm-Gg: ASbGncv8qISrCLtLh6mcB3L3ZaFtH605IyhmuNV6Cio/77Z7DhCaVZNFWr23D2VLPJt
	m5gQN1UAWH+y3WrN2V6qXpBu/RHD8YXTXUNO7ptXggY3l1IH0cjBavs+Nq3Vpo0dpOSR/1MZU5i
	i5TZ1TC831ZtVKE2D8tedHYFI=
X-Received: by 2002:a17:906:6a01:b0:ad1:79e0:12ed with SMTP id a640c23a62f3a-ad2192889famr72439766b.50.1746730569179;
        Thu, 08 May 2025 11:56:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLl7sgOTpwejG3xz9jkLXlv39/Be14qEJ5dyo2QzFtc0F6mLRKKOonkXn4jPGB3uyBhXFOUR3Td5jr4AtjFGA=
X-Received: by 2002:a17:906:6a01:b0:ad1:79e0:12ed with SMTP id
 a640c23a62f3a-ad2192889famr72437166b.50.1746730568763; Thu, 08 May 2025
 11:56:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507161328.156909-1-jsavitz@redhat.com> <20250507212600.GZ2023217@ZenIV>
In-Reply-To: <20250507212600.GZ2023217@ZenIV>
From: Joel Savitz <jsavitz@redhat.com>
Date: Thu, 8 May 2025 14:55:52 -0400
X-Gm-Features: ATxdqUGlDUuOTGPvBS05Om0DMREtnCsq4FO6AhQlxVZzo_JOvN-0yj2oCLzfOr8
Message-ID: <CAL1p7m5XO7vdzr85WUiSPsN9OGopj7zPEAVj8VNJ0RGNSRvzDg@mail.gmail.com>
Subject: Re: [PATCH] kernel/nsproxy: guard all put_*_ns() calls
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-kernel@vger.kernel.org, Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 5:41=E2=80=AFPM Al Viro <viro@zeniv.linux.org.uk> wr=
ote:
>
> On Wed, May 07, 2025 at 12:13:28PM -0400, Joel Savitz wrote:
> > In free_nsproxy() and the error path of create_new_namespaces() all
> > calls to put_*_ns() are guarded by a null pointer check except for
> > put_cgroup_ns() and put_net(). When CONFIG_NET_NS or CONFIG_GROUP is
> > unset, either of these functions may be called with a NULL argument.
> > This may or may not be handled correctly, but at the very least it is
> > certainly quicker to just perform the null check in all cases.
>
> Why not simply make put_net(NULL) et.al. no-op instead?
>

It looks like that's the case whenever a namespace is disabled, i.e.
when NULL might be passed as an argument. I posted a v2 that now
removes the include guards.

