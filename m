Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130EF215170
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 16:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738685125; cv=none; b=iwCcXpir+6qiaKkjhe48Bgx3pkOeD1BIN588SM34G73afPuRGQJ1q5BvponqOvnxvT+GdlHyTHp8pmozAocxAjyzfuza6AwjBgFt2SihAWqIIruT/wQIKVaMq6qa10X+kH24YDgqsYokgiXnPf1FV+Bk3apTX1mB5NldA+JIndw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738685125; c=relaxed/simple;
	bh=9S/Jsl9iZrO+/Bup4Wa899HOJVXQVIorM6lS3gKkxpg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mQgt3294QD8zz+2YsejapRPn8VtrnpaS096Eh3kDHl2yjCDdGJKQbnQqBsZ9WizLvE6NWx5SZusvvlNGAYzLSea0R7Fep65yM6kEn0fDgJ4tm3SdKxhjQ0WZD0WuCo2S/T0YjwIHORvmQtQofwrRYWS+si5pFy82DBJ+gTGgAyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Yo29/5VJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Yo29/5VJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738685122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9S/Jsl9iZrO+/Bup4Wa899HOJVXQVIorM6lS3gKkxpg=;
	b=Yo29/5VJUkJFDOFkDIbzmnuqmDMuOMaL/iTU/GAuNGAUUlx0tQADPHmUqv780icGK8cDAT
	MCus7k47XuF3VoKYMwEVJZcz0F0lmgFeBdMyo+rV0g3s60pyqqP6uchcblmiBGpZyzNoha
	6q8oCgSB+0VkSgBtpECO4PcBi8Vy28U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-uQOU2zDmOBmwONWaEYx9Ow-1; Tue, 04 Feb 2025 11:05:20 -0500
X-MC-Unique: uQOU2zDmOBmwONWaEYx9Ow-1
X-Mimecast-MFC-AGG-ID: uQOU2zDmOBmwONWaEYx9Ow
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4361a8fc3bdso29190675e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 08:05:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738685119; x=1739289919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9S/Jsl9iZrO+/Bup4Wa899HOJVXQVIorM6lS3gKkxpg=;
        b=hYAaPw9sCgp69UAtpN9U37xZuWTKisqhrSAWENIvVEgM4WDSVokp21VRePn8Q+R790
         H77rC9uOFdZLRRIKa5OAfZ8DJuIE5kRpUi5xCbyxPi2xgYhuy6OPMSt35E/VOkPMfsoL
         RxEP1XhuFsantWauT2o3DeaamwSMArPZo5x3sYxm8RN+c5rVOrfyBPAngrU7X2uA4DaK
         el8MW/7Uzk3EW8CrXakfORzKR5/3Ot2fqGyhtIyWVFuuFW78g0csXYYlPbUOvNARcPIA
         XBFU1erhvBTd6zrzPmMkUWKljF4X6fgSOo/osaWKjf27dSHfmnO32IoODyqg8fKm2Np0
         32RQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+8vz9O2OD6Kfgg/F3FIWwYpQIIJZI17dsZ3dfx/6yNTrVXgOWrrq0TW1WAIGNivVc/uHXTnG7bzKkZ4A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVlsCmyeUc9s116j4AZAgfIpYMcCDJjWZegxO6fVuEbqsNcWQz
	xsCUSDZ989bg+jN11BByq8e28HZF7vqkJz1xpmvoUsJRT6qGS20cuSISS9rX9F5s9ACdNYIMljj
	edv5Z2PdrhUslHeMoc1wrfchZu/0qq4wSVkOb/zrR/PPWdIWraUesSB+D/U5ramVI5ZnX8etTEQ
	tWexfOqfsYASW4uIn1tEYoqgrmys5yk2YOfX4Q
X-Gm-Gg: ASbGncvnwzTtBmlwCebP4KvKVX1aca+WkBDtClvo9zIdtDbS29z3z4wLNgcHOlBjsg9
	knOyvIoSNlZy/LrHtheJX7Indzt99IuH1rG1onAfukbximjiVlwfOhYt2H0lP
X-Received: by 2002:a05:6000:1869:b0:38d:af20:5f25 with SMTP id ffacd0b85a97d-38daf206192mr1976757f8f.29.1738685118860;
        Tue, 04 Feb 2025 08:05:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwaWzXVak280B85ArrjCFrUz02WwwEtsT242TiysJbuk+XtRUVzfEto4aIoAc0mUfIQAQs1mQgLIMWq94LkmM=
X-Received: by 2002:a05:6000:1869:b0:38d:af20:5f25 with SMTP id
 ffacd0b85a97d-38daf206192mr1976690f8f.29.1738685118379; Tue, 04 Feb 2025
 08:05:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250124163741.101568-1-pbonzini@redhat.com> <CAHk-=wg4Wm4x9GoUk6M8BhLsrhLj4+n8jA2Kg8XUQF=kxgNL9g@mail.gmail.com>
 <20250126142034.GA28135@redhat.com> <CAHk-=wiOSyfW3sgccrfVtanZGUSnjFidSbaP3tg9wapydb-u6g@mail.gmail.com>
 <20250126185354.GB28135@redhat.com> <CAHk-=wiA7wzJ9TLMbC6vfer+0F6S91XghxrdKGawO6uMQCfjtQ@mail.gmail.com>
 <20250127140947.GA22160@redhat.com> <CABgObfaar9uOx7t6vR0pqk6gU-yNOHX3=R1UHY4mbVwRX_wPkA@mail.gmail.com>
 <20250204-liehen-einmal-af13a3c66a61@brauner>
In-Reply-To: <20250204-liehen-einmal-af13a3c66a61@brauner>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 4 Feb 2025 17:05:06 +0100
X-Gm-Features: AWEUYZm64mwKLg6NjahAsD5Hi2sO80t05w3PJ4Q7RlO6xle2aHkFrCzoMQbba_M
Message-ID: <CABgObfaBizrwP6mh82U20Y0h9OwYa6OFn7QBspcGKak2r+5kUw@mail.gmail.com>
Subject: Re: [GIT PULL] KVM changes for Linux 6.14
To: Christian Brauner <brauner@kernel.org>
Cc: Oleg Nesterov <oleg@redhat.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, "Eric W. Biederman" <ebiederm@xmission.com>, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 3:19=E2=80=AFPM Christian Brauner <brauner@kernel.or=
g> wrote:
>
> On Mon, Jan 27, 2025 at 04:15:01PM +0100, Paolo Bonzini wrote:
> > On Mon, Jan 27, 2025 at 3:10=E2=80=AFPM Oleg Nesterov <oleg@redhat.com>=
 wrote:
> > > On 01/26, Linus Torvalds wrote:
> > > > On Sun, 26 Jan 2025 at 10:54, Oleg Nesterov <oleg@redhat.com> wrote=
:
> > > > >
> > > > > I don't think we even need to detect the /proc/self/ or /proc/sel=
f-thread/
> > > > > case, next_tid() can just check same_thread_group,
> > > >
> > > > That was my thinking yes.
> > > >
> > > > If we exclude them from /proc/*/task entirely, I'd worry that it wo=
uld
> > > > hide it from some management tool and be used for nefarious purpose=
s
> > >
> > > Agreed,
> > >
> > > > (even if they then show up elsewhere that the tool wouldn't look at=
).
> > >
> > > Even if we move them from /proc/*/task to /proc ?
> >
> > Indeed---as long as they show up somewhere, it's not worse than it
> > used to be. The reason why I'd prefer them to stay in /proc/*/task is
> > that moving them away at least partly negates the benefits of the
> > "workers are children of the starter" model. For example it
> > complicates measuring their cost within the process that runs the VM.
> > Maybe it's more of a romantic thing than a real practical issue,
> > because in the real world resource accounting for VMs is done via
> > cgroups. But unlike the lazy creation in KVM, which is overall pretty
> > self-contained, I am afraid the ugliness in procfs would be much worse
> > compared to the benefit, if there's a benefit at all.
> >
> > > Perhaps, I honestly do not know what will/can confuse userspace more.
> >
> > At the very least, marking workers as "Kthread: 1" makes sense and
> > should not cause too much confusion. I wouldn't go beyond that unless
> > we get more reports of similar issues, and I'm not even sure how
> > common it is for userspace libraries to check for single-threadedness.
>
> Sorry, just saw this thread now.
>
> What if we did what Linus suggests and hide (odd) user workers from
> /proc/<pid>/task/* but also added /proc/<pid>/workers/*. The latter
> would only list the workers that got spawned by the kernel for that
> particular task? This would acknowledge their somewhat special status
> and allow userspace to still detect them as "Hey, I didn't actually
> spawn those, they got shoved into my workload by the kernel for me.".

Wouldn't the workers then disappear completely from ps, top or other
tools that look at /proc/$PID/task? That seems a bit too underhanded
towards userspace...

Paolo

> (Another (ugly) alternative would be to abuse prctl() and have workloads
> opt-in to hiding user workers from /proc/<pid>/task/.)

