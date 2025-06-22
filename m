Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009211A23AD
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 22:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750632658; cv=none; b=aG8A0ODVboAD3R1zb88yUAreJNV33pT+64Xd4kUe3sRlpMYSeg+w3jVwwAJEbPa6qhfwSqolmrnhy7KtrSr5YwZJYd0qZ7w+9RlpUmfixAHrLSnxY22YRSdZVp+TTPLcF42TVrfslzAsTV8frEUagqR5IzejtUcDt1NnD9JGp/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750632658; c=relaxed/simple;
	bh=glegXgBvIj6/nhiB8cR6JlIJ8F8DQw8vk2YdK4Y46Qs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ry0fUT+MGCgAPRwP8Nd5PrBUC+Z9Bf3AdQpajywQuV+ToReILiOdBJEWHWgR983srL9DRlA9cmgkmeddRjKMiwz0N8GOZiaRmGVvxJrYMKImkqH5Lg/YgRCuzYuuyRnEYu/vSkdCAL8hFqYBM78P8y+4LYGHq8diIBf+tzWvPq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nQRMbE2n; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nQRMbE2n"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4a58197794eso240001cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 15:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750632656; x=1751237456; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FCkkmse9j7jIkQr/HtdtMMiFnJZl5VTksMugObu1Hv8=;
        b=nQRMbE2nD9iPqCbQVkkGHFBSfvnlilZAblaGcji0OuzmWEaOBYZqAUb0B53RuOWKmQ
         ihmCOL3XTwhkRAiFVgvPNiV9iVW+cYBZ22KSDOevZCCeOM61MBJK4ujFjGKveEb80862
         4k+A/G2e/prpIlR3RDR88Cl3gf0oExdV8s/U23OHn6MAV8Ftup28snAR7B2p71l7VghM
         U9WvH9UpcIblPgR2Q9QAY/VWB2/OUZL0LfC1/8oILw00r/RcU47QHWx5z00FbKfXntpw
         rlCzVOe2q61Ph4LyeZqri2Nadm/GegzK19coKR1A/hneEa/pZ6LzWQjDURnfcjXQLkZ4
         SkBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750632656; x=1751237456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FCkkmse9j7jIkQr/HtdtMMiFnJZl5VTksMugObu1Hv8=;
        b=tx3mBavSX0kxf4d0dtt1PbUi3K+NisaRfRy+xeNzT2FewO2G+mCOZfOW7kNA+LE6mW
         jxFc2r98NPOb1bdTvl+V/cgfB5SZGnJVOPFPLbfoB2AXd9P7p4cm+HpJ104jydKzPfCK
         DAnNhL/usChYPGNFy/2XXtkgPejSPSb9spAwR4H97n7/7Efiu3t62rixuIJ9EJ3yM9Na
         RWt0qCVxFCGNmAay50N5GfZbICw6Y/QZO+7DEkAin3eJENYwMNVO6lx0hU1PbTLf/esp
         wDEnEDg5jGizFLGrs9Zz4fsfF8nKnoZTWlVtpDNVC+6KqZsNjuTfGz+L+8onu4mpUvr2
         Ay/g==
X-Forwarded-Encrypted: i=1; AJvYcCWP4htVBpywb5HwIulSeqTzOkBrKSvsiiPZsT+08xe5LJc4KuMzt5q5FyFkRF2mZpYfLobpH8LK7+iB3Ec=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzgh7ZOvnEyqDEPH3QIBQTRCNkFW/QWDyfA7SuYohz87H7+5ZV
	NwIGFjE4NPDqWNA5JeIbcD6E2PcBXKuAmj1ZvUEgSMqkaWFZmyb+eUfv64KPOFMj4x+1pNn4svo
	pHdg5wfGLZ0hirqQCVpeNj5aa4US7c9W1GvktzBKy
X-Gm-Gg: ASbGnctXViIXGIE7qc+ekg7F5gWbpbz+d2n4I9BT5L1P6mRCh8/qsTGtuak/+EBN2Yx
	rlv75mFBoCXPIJs3ubTd4gHH3pZDB9rKIsvDLCFd9XkW9RCkEIqFCNG18/jEAlaYhniV/APu13Y
	QUwNkDMHW7s1GeH7tayNQuogyqh8qUW0dPkY9/7B5h/Q==
X-Google-Smtp-Source: AGHT+IHVv0cByUMuTtv+78NCbFEK8nCvWjD02fb+bjcGOT1F2fltAhal6PAAqK/gJ767TYT0EG9fKYVyt5sjERXqch8=
X-Received: by 2002:a05:622a:1b0b:b0:479:1958:d81a with SMTP id
 d75a77b69052e-4a7852db91amr5530501cf.6.1750632655398; Sun, 22 Jun 2025
 15:50:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202506181351.bba867dd-lkp@intel.com> <20250620100258.595495-1-00107082@163.com>
In-Reply-To: <20250620100258.595495-1-00107082@163.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 22 Jun 2025 15:50:44 -0700
X-Gm-Features: Ac12FXyniPz2R1npjK7ZfMtWGYaO4vFnkCBjbTvEwI2RPxVobAu7_RLwcpb6AtA
Message-ID: <CAJuCfpFLKR7CqAHG+QjHt4wCLgWmP7dD+f5D8Jx6gHUoXSe1AA@mail.gmail.com>
Subject: Re: CONFIG_TEST_VMALLOC=y conflict/race with alloc_tag_init
To: David Wang <00107082@163.com>
Cc: oliver.sang@intel.com, urezki@gmail.com, ahuang12@lenovo.com, 
	akpm@linux-foundation.org, bhe@redhat.com, hch@infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, lkp@intel.com, 
	mjguzik@gmail.com, oe-lkp@lists.linux.dev, harry.yoo@oracle.com, 
	kent.overstreet@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 3:03=E2=80=AFAM David Wang <00107082@163.com> wrote=
:
>
> On Wed, Jun 18, 2025 at 02:25:37PM +0800, kernel test robot wrote:
> >
> > Hello,
> >
> > for this change, we reported
> > "[linux-next:master] [lib/test_vmalloc.c]  7fc85b92db: Mem-Info"
> > in
> > https://lore.kernel.org/all/202505071555.e757f1e0-lkp@intel.com/
> >
> > at that time, we made some tests with x86_64 config which runs well.
> >
> > now we noticed the commit is in mainline now.
>
> > the config still has expected diff with parent:
> >
> > --- /pkg/linux/x86_64-randconfig-161-20250614/gcc-12/7a73348e5d4715b556=
5a53f21c01ea7b54e46cbd/.config   2025-06-17 14:40:29.481052101 +0800
> > +++ /pkg/linux/x86_64-randconfig-161-20250614/gcc-12/2d76e79315e403aab5=
95d4c8830b7a46c19f0f3b/.config   2025-06-17 14:41:18.448543738 +0800
> > @@ -7551,7 +7551,7 @@ CONFIG_TEST_IDA=3Dm
> >  CONFIG_TEST_MISC_MINOR=3Dm
> >  # CONFIG_TEST_LKM is not set
> >  CONFIG_TEST_BITOPS=3Dm
> > -CONFIG_TEST_VMALLOC=3Dm
> > +CONFIG_TEST_VMALLOC=3Dy
> >  # CONFIG_TEST_BPF is not set
> >  CONFIG_FIND_BIT_BENCHMARK=3Dm
> >  # CONFIG_TEST_FIRMWARE is not set
> >
> >
> > then we noticed similar random issue with x86_64 randconfig this time.
> >
> > 7a73348e5d4715b5 2d76e79315e403aab595d4c8830
> > ---------------- ---------------------------
> >        fail:runs  %reproduction    fail:runs
> >            |             |             |
> >            :199         34%          67:200   dmesg.KASAN:null-ptr-dere=
f_in_range[#-#]
> >            :199         34%          67:200   dmesg.Kernel_panic-not_sy=
ncing:Fatal_exception
> >            :199         34%          67:200   dmesg.Mem-Info
> >            :199         34%          67:200   dmesg.Oops:general_protec=
tion_fault,probably_for_non-canonical_address#:#[##]SMP_KASAN
> >            :199         34%          67:200   dmesg.RIP:down_read_trylo=
ck
> >
> > we don't have enough knowledge to understand the relationship between c=
ode
> > change and the random issues. just report what we obsverved in our test=
s FYI.
> >
>
> I think this is caused by a race between vmalloc_test_init and alloc_tag_=
init.
>
> vmalloc_test actually depends on alloc_tag via alloc_tag_top_users, becau=
se when
> memory allocation fails show_mem() would invoke alloc_tag_top_users.
>
> With following configuration:
>
> CONFIG_TEST_VMALLOC=3Dy
> CONFIG_MEM_ALLOC_PROFILING=3Dy
> CONFIG_MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT=3Dy
> CONFIG_MEM_ALLOC_PROFILING_DEBUG=3Dy
>
> If vmalloc_test_init starts before alloc_tag_init, show_mem() would cause
> a NULL deference because alloc_tag_cttype was not init yet.
>
> I add some debug to confirm this theory
> diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> index d48b80f3f007..9b8e7501010f 100644
> --- a/lib/alloc_tag.c
> +++ b/lib/alloc_tag.c
> @@ -133,6 +133,8 @@ size_t alloc_tag_top_users(struct codetag_bytes *tags=
, size_t count, bool can_sl
>         struct codetag *ct;
>         struct codetag_bytes n;
>         unsigned int i, nr =3D 0;
> +       pr_info("memory profiling alloc top %d: %llx\n", mem_profiling_su=
pport, (long long)alloc_tag_cttype);
> +       return 0;
>
>         if (can_sleep)
>                 codetag_lock_module_list(alloc_tag_cttype, true);
> @@ -831,6 +833,7 @@ static int __init alloc_tag_init(void)
>                 shutdown_mem_profiling(true);
>                 return PTR_ERR(alloc_tag_cttype);
>         }
> +       pr_info("memory profiling ready %d: %llx\n", mem_profiling_suppor=
t, (long long)alloc_tag_cttype);
>
>         return 0;
>  }
>
> When bootup the kernel, the log shows:
>
> $ sudo dmesg -T | grep profiling
> [Fri Jun 20 17:29:35 2025] memory profiling alloc top 1: 0  <--- alloc_ta=
g_cttype =3D=3D NULL
> [Fri Jun 20 17:30:24 2025] memory profiling ready 1: ffff9b1641aa06c0
>
>
> vmalloc_test_init should happened after alloc_tag_init if CONFIG_TEST_VMA=
LLOC=3Dy,
> or mem_show() should check whether alloc_tag is done initialized when cal=
ling
> alloc_tag_top_users

Thanks for reporting!
So, IIUC https://lore.kernel.org/all/20250620195305.1115151-1-harry.yoo@ora=
cle.com/
will address this issue as well. Is that correct?

>
>
>
> David
>
