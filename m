Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214041EA91
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 05:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751261951; cv=none; b=HwXH13AgN+q9g+lOmojr4h5EymRFo/qkBTBlR8wGMaCaFgWaEy2lZYSv82NWk5EbG8bxPy9hZiB2XcyGDL+AQFVJNEh8Tx9qjprm93JgGtnzNOWvrQzxsFMz1bc4uOhOQF4n4Bn7NeZTWHVgokLoVL8nFK+2zJ7e3yPKCqNb9DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751261951; c=relaxed/simple;
	bh=STvLSvI3bXV5MRDebB+H0lDZCapJSrHCO0gwLup4t18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YP+4VZo6P0xUqA9GI8Yat0OhxgGueTtrCefibNwxFVT7RV7PIqPHEKyLZ2BkG3nLuHLfLMOCbOBytpYxM6iJjYDgbcVaEGZilDR7gPG9XORMcGeYuvFF81KwdeUSjKYdGNZpcirUCE62WoDMhW2/wfYPS2YdtPdKQaztkUsiwFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GzeuN480; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GzeuN480"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751261948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H+yPkfa/82jXJdfl5P0ob1UvKY/Ai/24qnNzmbrCiio=;
	b=GzeuN480zvdeqtAyJg0kTB2hYKBNpC61r41D8IF1gJp3exh+cfIV8liaEHMKp4Wk+5VWS7
	QPBXvQpcK9YeHJodmFo9ayFQcXztqXt3inx5CRkQLGnt8m2ocI3zYyu+SLa/mYB6MhCW93
	pD3oQ+k11rSF7MRxC34r+43slsor5TU=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-253-Y6t6CzCGN1KFKmIHeC4nNQ-1; Mon, 30 Jun 2025 01:39:06 -0400
X-MC-Unique: Y6t6CzCGN1KFKmIHeC4nNQ-1
X-Mimecast-MFC-AGG-ID: Y6t6CzCGN1KFKmIHeC4nNQ_1751261945
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-553c6367ec1so2291120e87.1
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 22:39:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751261945; x=1751866745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H+yPkfa/82jXJdfl5P0ob1UvKY/Ai/24qnNzmbrCiio=;
        b=AkzVrMeeXgFDQW3tVFOAWuua1bcfBhvQP6qZrNECBNeIZyG2AxMUgsK1wsI8hS4d7P
         q6Pt6Ye8+PD7roo8sWLm+fY3n8R1B7OyGlbeWfXu4l5IkTFbsgcm+bxfI7ca3+/kRTy/
         vLhiEmbSTtIzi5+BsmPfpGT/6ILmKEyxcMrSTzBtcyCXSLZUSiG8VT0w3NXTRlqjtG/I
         5R6jo0zBiJqQeR4tCO3P9GfaXIUtsEeHw2kmxhgjEa1tKQLdFuE6xwPaUTFxCCzMhnUj
         OP0PDRWNqE0TjKw8vAYe5tEm4fc11IvaM7NdjuiIbdg8zMIB6xfOrwHilRre/RaLC2D5
         txbQ==
X-Forwarded-Encrypted: i=1; AJvYcCX65chaTaNwohhjqao+EmVmnTqy1u27P5WRSLrr+TyfS+qRuRggHvPXTsfTQJdGbht8FxOQhFwsA+3GqZA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAh0sxzBTKsgmiGcfAZghumcVdZJnAE0PamiU73cqDKhUXTo/3
	xUgDHNprbMfqCzZsbICV2tIP5hqjDX5UGVOSr0jMkw5HBsnZEdpsF7fkYeRgTByojThecZprM+E
	Wvx207u1HCPxDbiYxcweHHLq/KVRm697AmnHypcCzWITkSonAiewaIu7qiGylzF2220W9FoNev8
	+TVwr+0Wgrae5TSxzIUE0tiow1OmU37MiR7R6B12KZ
X-Gm-Gg: ASbGncukvWedRzRkRyGgI+gLEdm3lM682eDPVAklLUYoKjIOgKcpDcWDJfGaf/gbIzH
	yHfRzDhpdboMY2kuQN1KIPncokHmbNnYVRjvL3l4NzXIVc/kO68V1Y7D/ipZQmWzOR/1+1fIaP5
	l3pE8g
X-Received: by 2002:a05:6512:3d1b:b0:553:a877:2bb6 with SMTP id 2adb3069b0e04-5550ba0730fmr3782283e87.34.1751261944822;
        Sun, 29 Jun 2025 22:39:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYW6eITB9oXzHFoteUCtkOjrlLnbEcb6nt1ujxuVcl5i09AgbUjF69rOeDsssQS/1+92qsKYUvxAcyfCprQzA=
X-Received: by 2002:a05:6512:3d1b:b0:553:a877:2bb6 with SMTP id
 2adb3069b0e04-5550ba0730fmr3782272e87.34.1751261944350; Sun, 29 Jun 2025
 22:39:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250524061320.370630-1-yukuai1@huaweicloud.com>
 <808d3fb3-92a9-4a25-a70c-7408f20fb554@redhat.com> <288be678-990b-86f9-1ffd-858cee18eef3@huaweicloud.com>
 <CALTww28grnb=2tpJOG1o+rKG4rD7chjtV3Nmx9D1GJjQtVqWhA@mail.gmail.com> <3836a568-20c0-c034-7d7f-42a22fe77b4e@huaweicloud.com>
In-Reply-To: <3836a568-20c0-c034-7d7f-42a22fe77b4e@huaweicloud.com>
From: Xiao Ni <xni@redhat.com>
Date: Mon, 30 Jun 2025 13:38:52 +0800
X-Gm-Features: Ac12FXx4Gpc9GxOpUqYtSqRJhDoTCfVpAQB0w4c_fuoIjU9CWk6eJVZCjynkLGI
Message-ID: <CALTww281F6VhwfR+WRwSs0BYDdJai8aA0i9wg-gdu4emvhjFng@mail.gmail.com>
Subject: Re: [PATCH 00/23] md/llbitmap: md/md-llbitmap: introduce a new
 lockless bitmap
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: hch@lst.de, colyli@kernel.org, song@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org, yi.zhang@huawei.com, 
	yangerkun@huawei.com, johnny.chenyi@huawei.com, 
	"yukuai (C)" <yukuai3@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 11:46=E2=80=AFAM Yu Kuai <yukuai1@huaweicloud.com> =
wrote:
>
> Hi,
>
> =E5=9C=A8 2025/06/30 11:25, Xiao Ni =E5=86=99=E9=81=93:
> > On Mon, Jun 30, 2025 at 10:34=E2=80=AFAM Yu Kuai <yukuai1@huaweicloud.c=
om> wrote:
> >>
> >> Hi,
> >>
> >> =E5=9C=A8 2025/06/30 9:59, Xiao Ni =E5=86=99=E9=81=93:
> >>>
> >>> After reading other patches, I want to check if I understand right.
> >>>
> >>> The first write sets the bitmap bit. The second write which hits the
> >>> same block (one sector, 512 bits) will call llbitmap_infect_dirty_bit=
s
> >>> to set all other bits. Then the third write doesn't need to set bitma=
p
> >>> bits. If I'm right, the comments above should say only the first two
> >>> writes have additional overhead?
> >>
> >> Yes, for the same bit, it's twice; For different bit in the same block=
,
> >> it's third, by infect all bits in the block in the second.
> >
> > For different bits in the same block, test_and_set_bit(bit,
> > pctl->dirty) should be true too, right? So it infects other bits when
> > second write hits the same block too.
>
> The dirty will be cleared after bitmap_unplug.

I understand you now. The for loop in llbitmap_set_page_dirty is used
for new writes after unplug.
> >
> > [946761.035079] llbitmap_set_page_dirty:390 page[0] offset 2024, block =
3
> > [946761.035430] llbitmap_state_machine:646 delay raid456 initial recove=
ry
> > [946761.035802] llbitmap_state_machine:652 bit 1001 state from 0 to 3
> > [946761.036498] llbitmap_set_page_dirty:390 page[0] offset 2025, block =
3
> > [946761.036856] llbitmap_set_page_dirty:403 call llbitmap_infect_dirty_=
bits
> >
> > As the debug logs show, different bits in the same block, the second
> > write (offset 2025) infects other bits.
> >
> >>
> >>    For Reload action, if the bitmap bit is
> >>> NeedSync, the changed status will be x. It can't trigger resync/recov=
ery.
> >>
> >> This is not expected, see llbitmap_state_machine(), if old or new stat=
e
> >> is need_sync, it will trigger a resync.
> >>
> >> c =3D llbitmap_read(llbitmap, start);
> >> if (c =3D=3D BitNeedSync)
> >>    need_resync =3D true;
> >> -> for RELOAD case, need_resync is still set.
> >>
> >> state =3D state_machine[c][action];
> >> if (state =3D=3D BitNone)
> >>    continue
> >
> > If bitmap bit is BitNeedSync,
> > state_machine[BitNeedSync][BitmapActionReload] returns BitNone, so if
> > (state =3D=3D BitNone) is true, it can't set MD_RECOVERY_NEEDED and it
> > can't start sync after assembling the array.
>
> You missed what I said above that llbitmap_read() will trigger resync as
> well.
> >
> >> if (state =3D=3D BitNeedSync)
> >>    need_resync =3D true;
> >>
> >>>
> >>> For example:
> >>>
> >>> cat /sys/block/md127/md/llbitmap/bits
> >>> unwritten 3480
> >>> clean 2
> >>> dirty 0
> >>> need sync 510
> >>>
> >>> It doesn't do resync after aseembling the array. Does it need to modi=
fy
> >>> the changed status from x to NeedSync?
> >>
> >> Can you explain in detail how to reporduce this? Aseembling in my VM i=
s
> >> fine.
> >
> > I added many debug logs, so the sync request runs slowly. The test I do=
:
> > mdadm -CR /dev/md0 -l5 -n3 /dev/loop[0-2] --bitmap=3Dlockless -x 1 /dev=
/loop3
> > dd if=3D/dev/zero of=3D/dev/md0 bs=3D1M count=3D1 seek=3D500 oflag=3Ddi=
rect
> > mdadm --stop /dev/md0 (the sync thread finishes the region that two
> > bitmap bits represent, so you can see llbitmap/bits has 510 bits (need
> > sync))
> > mdadm -As
>
> I don't quite understand, in my case, mdadm -As works fine.

Sorry for this, I forgot I removed the codes in function llbitmap_state_mac=
hine
        //if (c =3D=3D BitNeedSync)
        //  need_resync =3D true;
The reason I do this: I find if the status table changes like this, it
doesn't need to check the original status anymore
-               [BitmapActionReload]            =3D BitNone,
+               [BitmapActionReload]            =3D BitNeedSync,//?


Regards
Xiao

Xiao
> >
> > Regards
> > Xiao
> >>
> >> Thanks,
> >> Kuai
> >>
> >>
> >
> >
> > .
> >
>

