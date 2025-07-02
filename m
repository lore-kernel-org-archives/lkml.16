Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AB12F7CE0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 18:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751481806; cv=none; b=QUD9Fh/UBLlPgH/KXbYYU7aHS1qqshDO/0GKIKEBOWjD0z5IpbZdvSK+Di9RvllVKViNWPDji4ABOqxxsVCurk8xFLwkb0jPdptH6Iuk+H9WRBbDtIz9hI1nAT9J+OiPEmf3ljr+3OtEkw2TC9vgDbPjfI5tJUJN2VP8PuVz2tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751481806; c=relaxed/simple;
	bh=TNInFk5CSqolYCTcQiouErpywLUQzlF2nTjGjEYSQjk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=K5i98lAGenIJJf1m7yBYEBJgNsswfzr0PoWNgqcnLqo7l538HMZT+8rn7scS6lcWjZOnxWk9FrA00izS8+FTdYFKxcH7TN4BEvBN3IFd539mrA95DIdQTXPNhGvi9RVxJ5pA5psJmKbqrl74pc000Ur9bZO2VBYG/tB1roBtMiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=otB81ZRH; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="otB81ZRH"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-313d346dc8dso8261422a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 11:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751481805; x=1752086605; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BkXeL5WEZDbS42FI4cLgeaVQ59trAJI79NiaZaMMINw=;
        b=otB81ZRHskW28Q4nyzxJAUN6r+V70IexTtm8IBwKnkU8uBTOZbtb3CSL2+J5qZ48xD
         zehjmjzsx2WxxKvK9Ce3+313TQGRMj0dYznQyYa0/GP9M3AZCXapteP31Kpec9qCwc8E
         CNp56/wDe3QOelo+grY8T8TDTNeCwmSx43i7HgDEem5RMuJs7o79pTyRvljqLNMswE50
         tezXgg7d5HXJ3RbIk87IgdcPOVPKxyjEdJ37n/t8VJZCDjlceEjRhSOQooOtY2d2fwaf
         +dtVXiHkJw7L1hGZPhu8L+DxV3hDHf3KIHS075m2kzxlEYZG5VOUf5xZYJeTUsJTLKeW
         zyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751481805; x=1752086605;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BkXeL5WEZDbS42FI4cLgeaVQ59trAJI79NiaZaMMINw=;
        b=w1EWw4mfE9x5Ffr0IYBNaVF3narmKWnhdrOISVxCJYpTHUccZm4lXvYQABJ4/SeIC8
         pvF2KyovkgwFkpyv0z5lnxQIu6PFxV8ZwnO9v5TDRyDFZwKjT/rO5yn8efUQ0mTYv60Q
         z6aY6rXlIC47EighljctAHLAu0hh7rEZlkfJ9EYC4DOJfcAQ7NUAjwDcfV/DdI+8yLqM
         AyIH7C1FFjr8nnadvtWvofwLpcDv+zK88ZusJSmHs15Nk7TY5eW+1Yc9jvVg1s5dfUiC
         e+Y7jFryt7H6UmS+l/nLrnYzHLU+19hasTB3ktD3AAongcv7OTkanA+ZclGWc/nJOGH8
         2Klw==
X-Forwarded-Encrypted: i=1; AJvYcCW9Qyjb4kyA9yzobYUal44ChFs/pOMeIItWqb3KzsOrLPMhWzYWVptY/cl5HOHAFeCQgdv0kqhr0WRzyaQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCrcxpCDlMW5cmi35FwwkOFHCQT1AozJioP/KinizGpYVM4TK5
	9M9+wyxWRQOScfiWQFaLtvp254SyZ92o1zKKbP5Z0ZWHzKAiaDcSrMqkApVGj3Ye5l1O7DDIlJX
	F36Q/RGHtnFkvETWqzxkfr2l/Wg==
X-Google-Smtp-Source: AGHT+IH1D7bLpxYmTDXOzRwdkEP/A6qvQMUvpigPT+QEJbt+kvTzeOztuKmrRtS0JYzImd2vqlH1A1VwyuT8Z8v8gA==
X-Received: from pjbsj10.prod.google.com ([2002:a17:90b:2d8a:b0:311:a879:981f])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5183:b0:311:c1ec:7d05 with SMTP id 98e67ed59e1d1-31a90c1faf7mr5874277a91.35.1751481804762;
 Wed, 02 Jul 2025 11:43:24 -0700 (PDT)
Date: Wed, 02 Jul 2025 11:43:23 -0700
In-Reply-To: <aGUW5PlofbcNJ7s1@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <4cbdfd3128a6dcc67df41b47336a4479a07bf1bd.camel@intel.com>
 <diqz5xghjca4.fsf@ackerleytng-ctop.c.googlers.com> <aGJxU95VvQvQ3bj6@yzhao56-desk.sh.intel.com>
 <a40d2c0105652dfcc01169775d6852bd4729c0a3.camel@intel.com>
 <diqzms9pjaki.fsf@ackerleytng-ctop.c.googlers.com> <fe6de7e7d72d0eed6c7a8df4ebff5f79259bd008.camel@intel.com>
 <aGNrlWw1K6nkWdmg@yzhao56-desk.sh.intel.com> <CAGtprH-csoPxG0hCexCUg_n4hQpsss83inRUMPRqJSFdBN0yTQ@mail.gmail.com>
 <aGN6GIFxh57ElHPA@yzhao56-desk.sh.intel.com> <diqzms9n4l8i.fsf@ackerleytng-ctop.c.googlers.com>
 <aGUW5PlofbcNJ7s1@yzhao56-desk.sh.intel.com>
Message-ID: <diqzecuy4eno.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [RFC PATCH 08/21] KVM: TDX: Increase/decrease folio ref for huge pages
From: Ackerley Tng <ackerleytng@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Vishal Annapurve <vannapurve@google.com>, "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, 
	"quic_eberman@quicinc.com" <quic_eberman@quicinc.com>, "Li, Xiaoyao" <xiaoyao.li@intel.com>, 
	"Shutemov, Kirill" <kirill.shutemov@intel.com>, "Hansen, Dave" <dave.hansen@intel.com>, 
	"david@redhat.com" <david@redhat.com>, "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>, 
	"vbabka@suse.cz" <vbabka@suse.cz>, "tabba@google.com" <tabba@google.com>, "Du, Fan" <fan.du@intel.com>, 
	"michael.roth@amd.com" <michael.roth@amd.com>, "seanjc@google.com" <seanjc@google.com>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, "Peng, Chao P" <chao.p.peng@intel.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "Yamahata, Isaku" <isaku.yamahata@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Weiny, Ira" <ira.weiny@intel.com>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "Li, Zhiquan1" <zhiquan1.li@intel.com>, 
	"jroedel@suse.de" <jroedel@suse.de>, "Miao, Jun" <jun.miao@intel.com>, 
	"pgonda@google.com" <pgonda@google.com>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Yan Zhao <yan.y.zhao@intel.com> writes:

> On Tue, Jul 01, 2025 at 03:09:01PM -0700, Ackerley Tng wrote:
>> Yan Zhao <yan.y.zhao@intel.com> writes:
>>=20
>> > On Mon, Jun 30, 2025 at 10:22:26PM -0700, Vishal Annapurve wrote:
>> >> On Mon, Jun 30, 2025 at 10:04=E2=80=AFPM Yan Zhao <yan.y.zhao@intel.c=
om> wrote:
>> >> >
>> >> > On Tue, Jul 01, 2025 at 05:45:54AM +0800, Edgecombe, Rick P wrote:
>> >> > > On Mon, 2025-06-30 at 12:25 -0700, Ackerley Tng wrote:
>> >> > > > > So for this we can do something similar. Have the arch/x86 si=
de of TDX grow
>> >> > > > > a
>> >> > > > > new tdx_buggy_shutdown(). Have it do an all-cpu IPI to kick C=
PUs out of
>> >> > > > > SEAMMODE, wbivnd, and set a "no more seamcalls" bool. Then an=
y SEAMCALLs
>> >> > > > > after
>> >> > > > > that will return a TDX_BUGGY_SHUTDOWN error, or similar. All =
TDs in the
>> >> > > > > system
>> >> > > > > die. Zap/cleanup paths return success in the buggy shutdown c=
ase.
>> >> > > > >
>> >> > > >
>> >> > > > Do you mean that on unmap/split failure:
>> >> > >
>> >> > > Maybe Yan can clarify here. I thought the HWpoison scenario was a=
bout TDX module
>> >> > My thinking is to set HWPoison to private pages whenever KVM_BUG_ON=
() was hit in
>> >> > TDX. i.e., when the page is still mapped in S-EPT but the TD is bug=
ged on and
>> >> > about to tear down.
>> >> >
>> >> > So, it could be due to KVM or TDX module bugs, which retries can't =
help.
>> >> >
>> >> > > bugs. Not TDX busy errors, demote failures, etc. If there are "no=
rmal" failures,
>> >> > > like the ones that can be fixed with retries, then I think HWPois=
on is not a
>> >> > > good option though.
>> >> > >
>> >> > > >  there is a way to make 100%
>> >> > > > sure all memory becomes re-usable by the rest of the host, usin=
g
>> >> > > > tdx_buggy_shutdown(), wbinvd, etc?
>> >> >
>> >> > Not sure about this approach. When TDX module is buggy and the page=
 is still
>> >> > accessible to guest as private pages, even with no-more SEAMCALLs f=
lag, is it
>> >> > safe enough for guest_memfd/hugetlb to re-assign the page to allow =
simultaneous
>> >> > access in shared memory with potential private access from TD or TD=
X module?
>> >>=20
>> >> If no more seamcalls are allowed and all cpus are made to exit SEAM
>> >> mode then how can there be potential private access from TD or TDX
>> >> module?
>> > Not sure. As Kirill said "TDX module has creative ways to corrupt it"
>> > https://lore.kernel.org/all/zlxgzuoqwrbuf54wfqycnuxzxz2yduqtsjinr5uq4s=
s7iuk2rt@qaaolzwsy6ki/.
>> >
>> > Or, could TDX just set a page flag, like what for XEN
>> >
>> >         /* XEN */
>> >         /* Pinned in Xen as a read-only pagetable page. */
>> >         PG_pinned =3D PG_owner_priv_1,
>> >
>> > e.g.
>> > 	PG_tdx_firmware_access =3D PG_owner_priv_1,
>> >
>> > Then, guest_memfd checks this flag on every zap and replace it with PG=
_hwpoison
>> > on behalf of TDX?
>>=20
>> I think this question probably arose because of a misunderstanding I
>> might have caused. I meant to set the HWpoison flag from the kernel, not
>> from within the TDX module. Please see [1].
> I understood.
> But as Rick pointed out
> https://lore.kernel.org/all/04d3e455d07042a0ab8e244e6462d9011c914581.came=
l@intel.com/,
> Manually setting the poison flag in KVM's TDX code (in host kernel) seems=
 risky.
>

Will address this in a reply to Rick's email, there's more context
there that I'd like to clarify.

>> In addition, if the TDX module (now referring specifically to the TDX
>> module and not the kernel) sets page flags, that won't work with
> Marking at per-folio level seems acceptable to me.
>

Will address this in a reply to Rick's email, there's more context there
that I'd like to clarify.

>> vmemmap-optimized folios. Setting a page flag on a vmemmap-optimized
>> folio will be setting the flag on a few pages.
> BTW, I have a concern regarding to the overhead vmemmap-optimization.
>
> In my system,
> with hugetlb_free_vmemmap=3Dfalse, the TD boot time is around 30s;
> with hugetlb_free_vmemmap=3Dtrue, the TD boot time is around 1m20s;
>
>

I'm aware of this, was investigating this for something similar
internally. In your system and test, were you working with 1G pages, or
2M pages?

>> [1] https://lore.kernel.org/all/diqzplej4llh.fsf@ackerleytng-ctop.c.goog=
lers.com/
