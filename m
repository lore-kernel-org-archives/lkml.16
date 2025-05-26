Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F893C17
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 00:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748218453; cv=none; b=pDJ2pbHTjH0RQgJndgcWZTbl6tdtCECM/DDVEHUoIBp/2J5idyB3w2eqUI8aXEaotU5xCvYmiV9GJBb97HRfTs9iSYzdOMmsdIp8nDSFE+EaXlGB1vjHxhmk9Ie6Os4rqSvunBEcStIShDowDym4aD9DG8uJX5qlgycKW+YvMXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748218453; c=relaxed/simple;
	bh=iDe4lZDbETTr6cH+2ajupIG1T+2mY+/63euX+PSeyeA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FhUL3GcbG1DXW+YyS0Tc8Bu298uBu4+i7tWQ+yE+i0NN7HQ7rwOS0GeIRpfwk5AbNUgm5aUoBbXDepeh+HjFtHb0qolRqw10J8Ifj2Zzza1oX3R/ZL96w+M3DoLtJRaOHnQpUBJeBVI8biZFeHQ59xt4if0Prt+QBw5YYkP8aP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PZ9IVZWN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PZ9IVZWN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748218450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eN3oaj49SxpTapfrR5Kx6feyOINmy5ifmldeIsI+GdE=;
	b=PZ9IVZWN6RZbLn84cHlCwSQh6v2O+mzvI+YDLgqkcGc7t3Kpp4ov7JCHrAQOJmUqKgF9lZ
	pjafF2t2gyX3E6wZ8BY+lOZGiVk/ocnTJCxGIzy7E+hd2ukKxjX+ywWCYFYASIZ4KAHk7Y
	S+/ppUbtgXVppNL/EUfC4VsTaJXIO5w=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-179-oLlQlbSAMm-zTRMJ1AkwcA-1; Sun, 25 May 2025 20:14:09 -0400
X-MC-Unique: oLlQlbSAMm-zTRMJ1AkwcA-1
X-Mimecast-MFC-AGG-ID: oLlQlbSAMm-zTRMJ1AkwcA_1748218447
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-32a63984ff3so811401fa.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 17:14:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748218447; x=1748823247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eN3oaj49SxpTapfrR5Kx6feyOINmy5ifmldeIsI+GdE=;
        b=P+TrMmOVlVhMdD2onWFTd/x8qn5oZGl4dATm9SfXmVYbrkqVvnL6LsSNXSDCBtW9Qg
         cN1fmmzq80cQPnC2CE9i2oqFJHQT7nCCXJEnbhht4jbWYB0TBfvJ49r/1GETiPb42WSN
         fAiHIVhty3TdKG2txsKge8kt3SWlwXBiqTUM+2i7k6m6H0YpDAc9KDDVfd6vCwPk4Hy3
         ocITKl/eSeikd63AWimPH5CORByIb0zrbkybXjaLuw1MT+OvQDJUDrfp7yFPrbOlGC5p
         GOnD+7KhFC4HSVp+Jt/qnJF8sfVfm/Htnp8n159fnT01XedD0onfF/eU+6qR5nenD+Sb
         RtJg==
X-Forwarded-Encrypted: i=1; AJvYcCWHCjfkfmPPr6J5GW06CKPBh+cVy6xgAO78xNxtL/iasjeVaZ9eq4nPvI2sKaIM1exBlggWLoTp6NPQXzg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8gRlLn8VQKkYH5Zo6PBOYsUlaxs8Bts7EFV2kd+ovu4xUKIKo
	T9DCOgtPcARoKQXY+sR7EEPVZj6wp2Ew1mRxgkZhOGp2AdlJK5RIimaVU1k8N2IONjUf2G6AdMi
	cKqnwzYlazg9j478mF5q2vVspZYeYxsgSuaX9JgKkb6qp4DCiTuqgeeXEMJwYIeUn8vFnHrFMmz
	e7BYRuPNPsRCuIpJg8JRl518Fha+mjxGfd+nMDKoix
X-Gm-Gg: ASbGncsHSHXnBHwz1SuQ7lOWfZFlAFgWVS4zOkpeyv1XMyQ+EQN44iu1C+sVV+cobqc
	TZ5JW22x31F2Jp3/zsdmWOILl/U+yP1HyX4PhSh5Fof0GwoJYcDVjGOa3MibjKyGfeRUGgT353V
	mLEAEEaVnue3y41NhQ/TNXxWs+bew=
X-Received: by 2002:a2e:9a0d:0:b0:306:10d6:28b0 with SMTP id 38308e7fff4ca-3295b9abf5bmr19741101fa.1.1748218447440;
        Sun, 25 May 2025 17:14:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYqd7DRtWr3jaLJFSDKEWBnLHgljTK2lxtoH5ZXpV4VmU21DbDCzjAl96FL+9zjwCpV7PWR8b4L3B3BLETJg4=
X-Received: by 2002:a2e:9a0d:0:b0:306:10d6:28b0 with SMTP id
 38308e7fff4ca-3295b9abf5bmr19741051fa.1.1748218447033; Sun, 25 May 2025
 17:14:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250522052453.GA42746@system.software.com> <20250522052806.GB42746@system.software.com>
In-Reply-To: <20250522052806.GB42746@system.software.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Sun, 25 May 2025 20:13:55 -0400
X-Gm-Features: AX0GCFtad-uSwrsrLSYZwA4ixTVDWUaEjIYDh7krVi0_0wqWeyR7j22VFo8HiVU
Message-ID: <CAK-6q+hOCq8aksDp33utOGwfFngnTbJo-mY3+FiCJVPzwP-xsg@mail.gmail.com>
Subject: Re: [RFC] DEPT(DEPendency Tracker) with DLM(Distributed Lock Manager)
To: Byungchul Park <byungchul@sk.com>
Cc: kernel_team@skhynix.com, linux-kernel@vger.kernel.org, 
	gfs2 <gfs2@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 22, 2025 at 1:28=E2=80=AFAM Byungchul Park <byungchul@sk.com> w=
rote:
>
> On Thu, May 22, 2025 at 02:24:53PM +0900, Byungchul Park wrote:
> > Hi Alexander,
> >
> > We briefly talked about dept with DLM in an external channel.  However,
> > it'd be great to discuss what to aim and how to make it in more detail,
> > in this mailing list.
> >
> > It's worth noting that dept doesn't track dependencies beyond different
> > contexts to avoid adding false dependencies by any chance, which means
> > though dept checks the dependency sanity *globally*, when it comes to
> > creating dependencies, it happens only within e.g. each single system
> > call context, each single irq context, each worker context, and so on,
> > with its unique context id assigned to each independent context.
> >
> > In order for dept to work on DLM, we need a way to assign a unique
> > context id to each interesting context in DLM's point of view, and let
> > dept know the id.  Once making it done, I think dept can work on DLM
> > perfectly.
>
> Plus, we need a way to share the global dependency graph used by dept
> between nodes too.
>

Having everything simulated and having nodes separated as
net-namespaces in one Linux kernel instance is I think at first
simpler to do and will show the "proof of concepts".
Sharing data between nodes is then just some memory area that is not
separated by per "struct net" context.

- Alex

