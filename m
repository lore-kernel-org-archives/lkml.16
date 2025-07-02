Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C8C21D3F6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 06:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751437775; cv=none; b=FHom34oAqdWXGYIq7/tisMi8wesjwOaYmx//CjRa2w/q1KwtsNxvbUQb5k1kL7Iy5ylEQFUyZKCPtX+xsO5nGAqIhGL/r0O5iEDtkEfl53a3Q/1PsKCjb7hAF0hOB9rtgbgwY0Ojsy/UGSC/xXvZfLDiplETQ/Cy/HPzuhILGz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751437775; c=relaxed/simple;
	bh=CfKSu8kEhLEtBjpsl9nJNx19AXqVSlJZLla68r13dyE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=potRFTIxlaiq8wMHA1y1GxDERC3QxWue2JwTfGXkGMX2oXdw8hbTr8f4FHTHnziqtG3/05vuD2JzAOJXLnf4EqRW+JdvSWdV7PAPhMNOPXyFIRabCnDUgyEBPjTgd1aQ5QqEWRrfOsm8Txslz7K6ID7Ptc2iIgrmrdeekw0jxsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BUCgIytf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BUCgIytf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751437773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=CfKSu8kEhLEtBjpsl9nJNx19AXqVSlJZLla68r13dyE=;
	b=BUCgIytfM8f4kCwuIrLfhqgbP8XevElar+4tZR24lg4ye8KDWQ/DQ2535fjuMZOdPslHGo
	ndpZ6EvbGDrzPXf2eB1WpqFNyy0oX+S90XFKANErcux/03en+v8Z1WLwnCGL95cUp0mwPj
	JATnkO49PK00g8FUZqSC8UlGyaoaTc8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-VNiHqw4fNXWQG-Z6GC93wQ-1; Wed, 02 Jul 2025 02:29:31 -0400
X-MC-Unique: VNiHqw4fNXWQG-Z6GC93wQ-1
X-Mimecast-MFC-AGG-ID: VNiHqw4fNXWQG-Z6GC93wQ_1751437770
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450df53d461so32247775e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 23:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751437770; x=1752042570;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CfKSu8kEhLEtBjpsl9nJNx19AXqVSlJZLla68r13dyE=;
        b=dfbsrjsAy+KMW6f2Mu3AtqI5DW6rjJ2IOy5wCIyg0KQb9eueXXIHMVaEC9DmXmFYOS
         ryU3AXX2mSkSNGpWyMh3JJBp3oEVNvkRmcD4yIJw1jC17uQvkwTn1DAaFhDJXsTQ/Fku
         GVB+OaJSsMzelmFeC2Y5W/NUgnrkzB3X6Z220gbUT9sG1yk6wFcIAGWA2dxE6riir/Zz
         4aN89nBrVMNu8hxG5aQIPx9SocqKiSjFU/YgsCQ9f9p2QsXq3sMJPeAguYnWFvxvROQW
         Znt17ODzz4z7mwnWEIaEj8DWH+Sq/yLqcboN3o1FhzV87CD3VVFtHKL5DdjzqZJBq2dC
         oypA==
X-Forwarded-Encrypted: i=1; AJvYcCXIEIQ/lcFysX5r9Y8Q0qc0rV9nPdreHa+sDmx+nQhTeGi9GaM+De1ResGR/frN7glRpdIDfqrfxCPIRqg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgkn8D3UyKG6KJKJfXqgDJUrQd8UnwJRfXvrwo6+WlfSKCby/5
	MYNoEwmv/gfepSUbYCpneItUojYAlk2YOJ2bmzZrwsXBETBiNIwd6cXhq0DzJ15+gGkbYPHBJOe
	w++mk+xy7ibdjfUpAZl9+WP5PWLcVHBBJWg+BwrPmJbA+bROcSAsRfjLOgzBpJDEuOw==
X-Gm-Gg: ASbGncuJ5CctxKA+u1+2tjCt6jcmeHKL7VF5qlJ0y16hU2mlGMV0a3UPeI9/f+7Srmn
	FaHDiZYh40SCCdbAz7hJOhmFphlRu3dHYUamz3pZnv+Hli72dvE3fYO23YwhG7U7lh7M/cD/hRc
	3IWi77B9AcwRCoQffVXBFhNuXd0/1ZSSsuc7IV3SBOCXmIpk5fEJ9jT4Q5NKaoo9c9EDCzcqTrL
	GNMEYf0AhUHhmK6e5cQUG0MdWEdC5Ncxe7FKX86kf3VGudKB2Py6yZfTKKKE8okXO5bA+4ns6lr
	UTxpcOANT31ivwVYmchJxCbwRMy5z4YfbqxnhjXQLkT4L7B0
X-Received: by 2002:a05:600c:4f16:b0:453:86cc:739c with SMTP id 5b1f17b1804b1-454a36dd7b7mr15163825e9.1.1751437770377;
        Tue, 01 Jul 2025 23:29:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEynGfn8zWf+E+Vah2RMMvoHI+5K19PrvJWfShzG6FXGthFhaZImMS2EAvK/7nzYpn2VsAVag==
X-Received: by 2002:a05:600c:4f16:b0:453:86cc:739c with SMTP id 5b1f17b1804b1-454a36dd7b7mr15163605e9.1.1751437769983;
        Tue, 01 Jul 2025 23:29:29 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a390d55sm192574235e9.6.2025.07.01.23.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 23:29:29 -0700 (PDT)
Message-ID: <309ecabeacc72f13de7b190f37423f1aeafe991d.camel@redhat.com>
Subject: Re: [PATCH v10 17/19] rv: Add rtapp_sleep monitor
From: Gabriele Monaco <gmonaco@redhat.com>
To: Steven Rostedt <rostedt@goodmis.org>, Nam Cao <namcao@linutronix.de>
Cc: linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	john.ogness@linutronix.de
Date: Wed, 02 Jul 2025 08:29:28 +0200
In-Reply-To: <20250701171715.5a1a99a0@batman.local.home>
References: <cover.1749547399.git.namcao@linutronix.de>
		<d3cf55d3bf42a0f70a58c394b5cf6d603ca8a9f7.1749547399.git.namcao@linutronix.de>
		<20250630203401.1a11e58f@gandalf.local.home>
		<20250701051757.mBjQVdoo@linutronix.de>
		<20250701110218.5e742850@batman.local.home>
		<20250701110551.5c2dc2ee@batman.local.home>
		<20250701151114.OJQTlRCY@linutronix.de>
		<20250701111704.00456667@batman.local.home>
		<20250701210338.BooVbo54@linutronix.de>
	 <20250701171715.5a1a99a0@batman.local.home>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0



On Tue, 2025-07-01 at 17:17 -0400, Steven Rostedt wrote:
> On Tue, 1 Jul 2025 23:03:38 +0200
> Nam Cao <namcao@linutronix.de> wrote:
> >=20
> > > Bonus points if it shows how it was generated so that people will
> > > know
> > > how to regenerate it.=C2=A0=20
> >=20
> > If it's okay, not in this series. It requires changes to the RV
> > core
> > script, and I prefer not touching things which are not LTL-specific
> > for
> > now, unless necessary. The DA monitors and the containers do not
> > have it as
> > well.
>=20
> Yeah, just update this set to state that this code was generated.
>=20
> >=20
> > Let me stash it into my TODO list of RV cleanups. I will add this
> > for LTL,
> > deterministic automaton and container in one go.
>=20

That's a good point, at the moment the DA monitors have a comment in
the /completely/ generated files (the automata header), the others
where just a skeleton is prepared have some hints that we removed while
filling the monitor.

I'd say for now it's good to just add a comment in the LTL header (like
Dot2k:fill_model_h_header), then we can adapt all generated files
(whether fully or not) to have also the actual command that generated
them starting from the model file.
Or did you have something different in mind, Nam?

Anyway this is all well documented, so pointing to the documentation
like we do in the header doesn't look bad to me.

Thanks,
Gabriele

