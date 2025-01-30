Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809C718756A
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 19:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738265486; cv=none; b=j5kTEdeiyDcNNMZL5q+rrXiboIbcpH/YuxW68CGaootAtUqIMV+Ca/FclkjZu7AnKdjeMVhRxrfP+f8tXFRCb0TPuGa7qD6rAAWhvlFRp4TBoaBkKSV373zJygNPxiUCbZz7ZCXb8KpWQ1GS5uSB6mcoEYuzfOZ0XdXEC2GQxcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738265486; c=relaxed/simple;
	bh=d1rgKVEl8OUlaljZGhdwTW0BxXvvCP6MoRAeb84p26k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sg5+PPaLQKRmoEZbNOqhbXrXfEsH3S7uCbhcXTUVbfnFOEtJ76U9wELjAxhsmVFNgKjIKH+LkVcgc2aIaKWU2EaXmDBuVwCWqn/aNse+ewg7W3DniUvu3GUgr/nERc2mNThOa+MkViLtOTuN57ehuenwSe6zbG2kYEi+Lhi4vWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=jqnMymBM; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="jqnMymBM"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-467b74a1754so14725681cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 11:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1738265483; x=1738870283; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hNJlrraj+NS8urRTPwYhzJT1Z4ljAUAGM1uhK6PJJ3A=;
        b=jqnMymBMH1bJBANsLKsvFqomsqJqevG68UmxOpNw+qsZbLfIhhLYsNL9HIIWHFD5Ie
         H7NsxOrExeCXB09tM9IZDyMv1/MeMW3IDrDOw5aejoWZbT2yZh7jfsSm8LaAqAAxMted
         x349UmqoEST9WPLdvJ/AtYROgi/mpgrMravXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738265483; x=1738870283;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hNJlrraj+NS8urRTPwYhzJT1Z4ljAUAGM1uhK6PJJ3A=;
        b=tWb9NaAP7B/LLrRysywbXccS+9vBME08QdwyJcxnle/vwJgNlBOp+4sJWwKz3iO/gx
         iH910Ln/6toZ0OVCvOh2zQIX+LzgCo8cFEEJcr5TvyXjtaXFAxRbSrZJuhSJE2Gz5FA0
         5Z5xSkzXzLQbcedf7m9wNXl8FGmCZBtt12H1E0A3iwW+WIsOwE/9RxpWw83GqsTYBuyb
         uNlCnQZPB/vZjPLxS1LAine5gQHYiI/CdjSGY62oN/z4oNdZ8leHytI1Xcq7DkPPN4sJ
         sqGUBvSkd9zznJF4TNPC6iKGioFzSuf/+H+XemreWGYTVbcp23A7CoIqCMHO6FUkTR0T
         aQQA==
X-Forwarded-Encrypted: i=1; AJvYcCWR4NXAEA+bOgTNkm8/csP1k6BpQ2z5ltHicdmGrHS93WG1yvYdTjFJ51uURRaKemIqLrIp/8jwWByshY8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyve6F4L8EmQJJldG30OMZv975ykuvxnOLjwMChMjKhiDI6f6q5
	O4VacZ4LX08ZsmLix/RHt5AoVUy9WPnYpEYPBuf6Tcmx1tjjssx2WzA4sLO8SFqoy3Rp4LE1bCT
	whYKLCEfWe827gWp6MSW4yBXT7v+n9ea4O+4/Ig==
X-Gm-Gg: ASbGncsuR5Vm6Ar9SxDx+nqSCXF6eOWEfuCHKOEJAKu70LXQyVrhfE0RbaN+mBOVdqx
	NnKAS3vU1MiRhDAtfskbhQ8EoRoRFq2RoJbDdawCGqitbEAc5JXDswFGSYYX5ALmuqWY1+zU=
X-Google-Smtp-Source: AGHT+IFl4CMUaxxoTAkD3ytGkNPTgdcXl7FHT5IGxpTES0qvo6U1WEtsDKa/o+LlYiHbMpSzEfndZl4dXRo18XfEkb8=
X-Received: by 2002:a05:622a:1e92:b0:467:6226:bfc1 with SMTP id
 d75a77b69052e-46fd0adcbeamr143067151cf.29.1738265483293; Thu, 30 Jan 2025
 11:31:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250127044721.GD1977892@ZenIV> <Z5fAOpnFoXMgpCWb@lappy>
 <20250127173634.GF1977892@ZenIV> <Z5fyAPnvtNPPF5L3@lappy> <20250127213456.GH1977892@ZenIV>
 <20250127224059.GI1977892@ZenIV> <Z5gWQnUDMyE5sniC@lappy> <20250128002659.GJ1977892@ZenIV>
 <20250128003155.GK1977892@ZenIV> <20250130043707.GT1977892@ZenIV> <CAHk-=wjKkZBM6w+Kc+nufJVdnBzzXwPiNdzWieN3c7dEq9bMaQ@mail.gmail.com>
In-Reply-To: <CAHk-=wjKkZBM6w+Kc+nufJVdnBzzXwPiNdzWieN3c7dEq9bMaQ@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 30 Jan 2025 20:31:12 +0100
X-Gm-Features: AWEUYZktgPbha6NuweUOoTEq2caO0ElwB8qKM3f-z5Cb9qH4_d_KA6x5j2Uvctk
Message-ID: <CAJfpegs+Lnp=zw1auUhVrahTg08RvK8eEFTK1R6jMfMAUNRg2Q@mail.gmail.com>
Subject: Re: [git pull] d_revalidate pile (v2)
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Miklos Szeredi <mszeredi@redhat.com>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 Jan 2025 at 18:25, Linus Torvalds
<torvalds@linux-foundation.org> wrote:

> So my resolution continues on that, and ends up with three in_args, like this:
>
>         args->in_numargs = 3;
>         fuse_set_zero_arg0(args);
>         args->in_args[1].size = name->len;
>         args->in_args[1].value = name->name;
>         args->in_args[2].size = 1;
>         args->in_args[2].value = "";
>
> which looks straightforward enough, but I have not tested this AT ALL.

Yes, this works fine.

Thanks,
Miklos
