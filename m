Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14DA1EDA14
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 22:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750632908; cv=none; b=iUyAnKyxm6O/Sbq3Z5rSsUnX3GkOU9z8h4uBGaLPZZdQpLmOJfvFME81rUmKMYS5F1TVZa2ESb+cP5Tn8I2jqfagWg60g5zY4nxkJ4Y2BZtrRCp0QxdNRBnSpaSM/aLe9J7eSi/VAXKGeWbWRYBJJNT9lOSdybS+AxU1BeQVE2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750632908; c=relaxed/simple;
	bh=xK2CLVq3Is4VPm+l3tHtvyv14lsDh0lQ40rUx7lkgd8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oRHQEJE9j4qO+Jw/xRfM6rYHo87ZQvE6IOxOHrJnArxPj82mEXaNVI/Tc7P62Wfl0Vu68RqIoZDv6WeBESwIvGVtG2XfQJTiN5f+4hWkUfvuQ3zdotEJ07HzxrgdbwWgAgYhhDXNIqdS3CHLpktJDdmz1d/OCQenhoQ6+/J/CT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OB+nOCpf; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OB+nOCpf"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4a5ac8fae12so482881cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 15:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750632905; x=1751237705; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LodTZgviwQCColrSYTFMFWGsNsxbA8ukT1ulcMQya0=;
        b=OB+nOCpf8JCFA2xuK5Ob7op1D1htvURE/UG+qguK3siYzvo71tkjxuk5KiSiOoY9lj
         L3/a8CfmP3LQXXqvbKUHm6DgaXos70FL6VENEKi8UHcJcdh3doPaOJ1EWgo43mqB6HFf
         X/fk0wL+AN2r0bHGOCqnOW8l9B3qdd88H0A48w9lgwUwN9fTCyGNMHN1bwfN1Cye+ja5
         WmN5Or0FCacT/XQq6ZHO/N+vGtMJfd5lOAKSoURcJ7BGL1g5bbmTXRhN9DrGY1ZFHl+y
         NPdM+iEGJ58nuOeS4Z531stCZPq6MFRdWoPAJze3Y0cpn1YbeUzWCCShtPBUpfiUyNyK
         qrlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750632905; x=1751237705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1LodTZgviwQCColrSYTFMFWGsNsxbA8ukT1ulcMQya0=;
        b=fZdYf8QkKeBDZJ6qXl1XytBPs7GE4t+1iZo0aVAw3mAMokZOaqPsCSWynbRCRjBXfE
         IsuPSkVXmUJQy/RoeJEuhqAxVbMWphEO6opOGSjC/RiXfMSY2976dcn3FNJA/I0/LRqW
         s+6TzHqdhN9I1i9rzp1uXl22iGoElTWa3ttu1QzkoOm0GOqzvVe3W25Nscz/dVusN6AE
         VFIwb7i9yr1ao6F8xPz6/HgzrE0KAt5J8jmMMiGdzshRLkg8yMeEL826VNG2oOFbIc1u
         Coi/1R7TgDyUyzH6D6XmHzHkvX6xX8Zlmyojm/ZUWHiIueNJxAo4oq2Hr8eUlqwYwyZH
         +nOA==
X-Forwarded-Encrypted: i=1; AJvYcCXwop+S5ClvL9DWiiuAG4mdy8L39cmyQI7HzupaYEgHii8xiLio+Gdvptpc3sJ68W631Mn9AIWxvFezOTo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyG9/72IFirlnRYCivjAujLVq7MmESMahTbt0qM323ZcO3gCm2P
	aJ/MV4vJqUZyQdtUhHm7cXhv++CZPLLxzYq8BFhHiCRPi+G4PY/s54rFIhBoAidW52FYaWte1Zq
	SCCcq5HgrJo9t/5FfxoPic217Ec8jqTwj9cKdwZ0+
X-Gm-Gg: ASbGnct9W2dzd2exAF74X4sXWppVkTnDtpamqQR7j9XnJVRQrHTofTcIfb1Q0dVLUlX
	78wpTFuVgDBl8oxa+hoqJzFXcHYpBTVlZvsORNKefaaNIMkRjTGWmj3va2aSrYgZpUf91Z1cqnc
	06yP2r9QkNKotZUIThVmDL+q4v6Y2q3UCo9Q+k250Ksw==
X-Google-Smtp-Source: AGHT+IEh4r++muE0+54bkQVWcCNPb8S2goe0sFIf2ptzwdq+dpVtJrPCLne9En9R/gCpFIw1bD2APr8sOa15VBLmZ/w=
X-Received: by 2002:a05:622a:8303:b0:4a6:907e:61ca with SMTP id
 d75a77b69052e-4a7852db6a2mr4639641cf.12.1750632905152; Sun, 22 Jun 2025
 15:55:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202506181351.bba867dd-lkp@intel.com> <aFQaY4Bxle8-GT6O@harry>
 <aFQnEj0UASzl2Lxa@hyeyoo> <aFUgJgrc_eIHRy5-@pc636>
In-Reply-To: <aFUgJgrc_eIHRy5-@pc636>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 22 Jun 2025 15:54:51 -0700
X-Gm-Features: Ac12FXxeU_n5ynTLFvoQ9shhqQWVGywECVI_A3zkfAgBf_JvjzTobm693NEF1_8
Message-ID: <CAJuCfpHRVq+T8v-7J0kJ=mnbSJYX2kjG_8spgZFdfe4Tzbcs4g@mail.gmail.com>
Subject: Re: Kernel crash due to alloc_tag_top_users() being called when !mem_profiling_support?
To: Uladzislau Rezki <urezki@gmail.com>
Cc: Harry Yoo <harry.yoo@oracle.com>, kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, 
	Adrian Huang <ahuang12@lenovo.com>, Christop Hellwig <hch@infradead.org>, 
	Mateusz Guzik <mjguzik@gmail.com>, linux-mm@kvack.org, 
	Kent Overstreet <kent.overstreet@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 1:47=E2=80=AFAM Uladzislau Rezki <urezki@gmail.com>=
 wrote:
>
> On Fri, Jun 20, 2025 at 12:04:50AM +0900, Harry Yoo wrote:
> > On Thu, Jun 19, 2025 at 11:10:43PM +0900, Harry Yoo wrote:
> > > On Wed, Jun 18, 2025 at 02:25:37PM +0800, kernel test robot wrote:
> > > >
> > > > Hello,
> > > >
> > > > for this change, we reported
> > > > "[linux-next:master] [lib/test_vmalloc.c]  7fc85b92db: Mem-Info"
> > > > in
> > > > https://lore.kernel.org/all/202505071555.e757f1e0-lkp@intel.com/
> > > >
> > > > at that time, we made some tests with x86_64 config which runs well=
.
> > > >
> > > > now we noticed the commit is in mainline now.
> > >
> > > (Re-sending due to not Ccing people and the list...)
> > >
> > > Hi, I'm facing the same error on my testing environment.
> >
> > I should have clarified that the reason the kernel failed to allocate
> > memory on my machine was due to running out of memory, not because of t=
he
> > vmalloc test module.
> >
> > But based on the fact that the test case (align_shift_alloc_test) is
> > expected to fail, the issue here is not memory allocation failure
> > itself, but rather that the kernel crashes when the allocation fails.
> >
> It looks someone tries to test the CONFIG_TEST_VMALLOC=3Dy as built-in
> approach test-cases. Yes, it will trigger a lot of warnings as some
> use cases are supposed to be failed. This will trigger a lot of kernel
> warnings which can be considered by test-robot or people as problem.
>
> In this case i can exclude those use cases or even not run at all unless
> boot-parameters properly sets if built-in.

Sorry, I'm catching up on my email backlog. IIUC
https://lore.kernel.org/all/20250620195305.1115151-1-harry.yoo@oracle.com/
addresses this issue. Is my understanding correct?

>
> --
> Uladzislau Rezki
