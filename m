Received: from sonic309-21.consmr.mail.gq1.yahoo.com (sonic309-21.consmr.mail.gq1.yahoo.com [98.137.65.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E490F221294
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 21:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=98.137.65.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749676798; cv=none; b=PFW743FrpQ6toM3AXzfzqzrlFLGcBg14GV3jvGIa3IcKiXntC43TyvN0+IDQsoa/nDHg72rHcC1Wv0RapTOO+gORrMv/aTZ0SEQx7khi6dFA/iyy+wJz4NHmYdO376w1NEEKVFXVrdHWG1CXkBaaspchssYJ36yPBXLa7rcvjPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749676798; c=relaxed/simple;
	bh=RgiEN215K9HvHdG5bCdRGDth2UiwDiTfQCW5BOvoxOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hMUyyAmZ7EMkodWIorvBl95Y/ByquAnTjh3Th6DnVjzmcozp6aRhPHgZXUxY6IMm+43mL48vAoXtMmwAzN82Nt63kH+q5foL+xe0V4zvQI/S+fiR4Yz/ceC+mzoFP84bf+x968xZmSIMMzcdlUBJDCLSgC39UNb6vQXttKab0RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=netscape.net; spf=pass smtp.mailfrom=netscape.net; dkim=pass (2048-bit key) header.d=netscape.net header.i=@netscape.net header.b=Yep/kmRc; arc=none smtp.client-ip=98.137.65.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=netscape.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netscape.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netscape.net header.i=@netscape.net header.b="Yep/kmRc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1749676790; bh=WMY3NvcWXS0B0R2y6CGAr0cpFfD3M63L1PMUB/jUFTc=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=Yep/kmRcCVPzpqaMz89lMKFyPfzMwbS2wj7H3DDOXpweLrFF07VhdpsutTlUEQWnEJpx0+aB6pqjBhIgJCvhfIb+QsJnf3q8zRW/SjpWpYNK+fUdZg/ZoLr3KT5dIy13bjZBBcSJqbl/vOJo64Y9JOqspqeHSjgSXjocdsXbYKGfazlwB1Dqcwre6tViPF8NTMwyGrujxyFfOUlydpDyXFmQa6Pt/1ziFMDM13q35+vj667j90Xo4kik09WkuFgQPyWbx7yNZyfObF1J4l0a23C3Swg0aOQwbSrgOb8kP3yB+JRUzmoxPs1TMlMiUULLZxov+Oekcm79ZcwYyBQqQw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1749676790; bh=I9NtFpesGiilmxUW1EoRC6BWrPvACaOiZABvUD27WVQ=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=Z/kI6G48urNPumIIcGH6HuD9+q00oajpD1xboafNxKcd85wpZz3VpoYKhfqVgg0XuLvin1m9F/5OSCiL180Kmm9ItuTvNT56RKfEBsEoCW6K4RlYobiLHEMLKG9QeuWcBEVp/GK2VH1R1cpYpQ1eWdbDtXa3xK7Z+JxX86dq96yskfimEyok46MZMqhYisM3tbR+raqzO3iAcs1SezN6kQF/cOD+2MVwpauEivwXbgIMbd0pUJZgN8C87mfga0pc752ALx1lXfE/fy6IjkV13qX/JHeaY5PaEAW9Miidj8TL+TRCZiTYNPpI2PEsNc6euUPbKx7xy37qRsjcLwhsqQ==
X-YMail-OSG: 7xnI42kVM1k9wbONvAkH9k_5qKUHXbdQjq0_Rl3vnvRIBXviDzL2iNtMadjO_V4
 CidATuiL2Z2OUR4RAlu1fysrXV.n.ZAtzIiyvvzRgpbOFNxl.NeqE5BvVxSsh_RDrQ5Vd1ltZsCk
 C18ul21KmkFq2PNi1rK1VUvfIStD50UxNR2Nm4UZ9VwGAplY.heTxMaEIpgcZqogTduxKiAkk4dq
 RKH9mkjuoVbKkKtJvatIg6t8DdbsmGXUlkKzIYjKC4.ojp8UepEtGoK1pDGVp9UW0wz5Q596L3aC
 jt_MZEgQYbUzIdRfA2LASvUAAOqzjaDJQQ8ghG_6XXjXMUp9bQEaPkGfPj7hE_zrLLvK9qVUGLdL
 Acqd4F_zn.zh146MWsIVYSccMZN.FBksqVnRdkEvbYioeVbzAuKYHn61oOYeIrb2hnldDtxFQpRi
 vhnsCVEKbDdv5FnAHlojaDbInLNw3VuD9cN2YdSy5GzWvj48XmWY3eSAMgsuaF6kTUir27ILDeCM
 eDIN.KFyZaenUVpNSfwPoJzu4BquxPjRMCHVwx_tEUqKTvAH8Tgm.D6upgJBasSeR5r_upaivoqS
 NDqrW5Tqv0S_OPi9Vg3E3QE2JORWiiajlYY0TVTZfTPCVLlFS5ePvHvOeF95NgfjeVtR.Ins5Geo
 PgzfKaiBsWMRe8HoZO8bH1eX3iXyj9OLlHVocZUBu9GrJri1Fi6gmperDOPcG8DbyPhmAhbwkzDn
 FF5oqwD0ETQItAFrYY3zZ40ZwgT8a2OZftAkgUkh7oQvdLBtXaIAOYr3SAleJHJ9cfsju9InYwk8
 86lj_9ciU0qpWYiaR49t951VWqExktnQsQm96PREuoPkawd1uPZD3vlyNHoIWTUv9dMWWi8u1yjK
 xHmuSG8W7oqYe.CWcq2tk02GuCdqIKDsTBUcxr8ERX1cPq1Tx67y1A_ilefQKzgSgWkkU5b3xIRN
 9MCPCFIozaUx1BneTRr6CRnDoA2E.o5yo3bo_siw7PFOjr_pvJq5Qv0XEHIQXVidAQgvyWe_04Xx
 Vm11IbMLzBzJYPwr6oRTfJS2WdsgDyOkbDuhFtz1zcuqUIJbTsG4gBp2xd9747P10JxFI2HcAtP5
 2uHWMwVsFkwrLxx2bo5dFlRU4KEVWQp8UY45ikp2E8V7DacuEAXxMuCD9W.CVtW6FUFivUCpRJKM
 Rgih9QPzblylKDb2GorM_lB4R.j0Mx4HUrDcb2lL_LM5vi.STlU.YdoP8DC6N.3txVuKzAXhqx2_
 MztGyNsXnNwRolYSjFpwuQ9xnl.kNmijG5Nb6togk9CLdsgb5kF3W0o1HIwq8Yd4YE4eG_nQL2sb
 7Q_BO4yH_Y0BypBfqB6DWpjlB17nyD8fD4ROabpluhkFyY4XxmTky3ToZ7Qv8SELISFdOtpTDius
 zVaOi5HXbB6XejZd2kEn8TcVwtlmSKx.JdP8KZsDhpxAA7GR2ODmYBnzCE91a.Y5WMidU1AN8ndt
 ur5N9YPJJp6GdOG1Yq4INLTfRre6dipJA9bG.0kkICO8ihpDzAvjyG12VDz2.Gsf0ogqGzU2Gryt
 TbeDaE.gH1lBILk3rAV6bheAMEpus0udytxGu7MSoF2cM9_Fj0ONtArvk7zuvNXUQ83XHcLkb_.N
 6_VazYnrEsYs2vBVohVVCVr7VYZfc4cEwDo8Cp8xOiym8h6zF7EHso6QQxygkCjaFjA1QvTT1YFT
 05_fHXpI815nVxIPdMWXzlvyG0z9.rRYuk_d7xIBzrF494yKzx2AwEGoL6l1AR64xcDJd6UEwnVr
 fqdzZDfcxfEzHHehvbokQBNC8weiBrbvPWEu1ePhLaeT4vtaUl9GaUdRwX2KSe5YW2m_DsAEkISl
 6CXLDmHr.5v7A51FQfqmg_mgboaYH4YaJop_JGVXTPQ76mgfukSyyE50R7omdT1aU2o3q0R6OOH9
 BakSUPz4vbicMi7Z8xCUdlo8tv2PgflVUY7gAydkBMTnsJaVexFEuX8OYvkmCZSlugsvzg76M8NG
 Yy5V_xiqsBJ8tmNrMdN0vuDWlZQ154snwtjVA5yobIbxYhaYuEKxpMqFCiZ.LeHlDN4h7VtAawpe
 C_FQqZQUO.UPdkjFkQ7WSL0Qal4vXeVE7fHwfak.igpckxZrOQKXrs3q2oYQjjvIlgcI6j7jpOt3
 zZ8j11OsdN4tsZ7i1vxVWEROsJUw2bKISZk0LDg7ViFjHgm5GYubGe3E1YKmkB4CC2OJmEXVJMvs
 nJduIiVdDcrZZBsh00Kp8Iep6WQ--
X-Sonic-MF: <brchuckz@netscape.net>
X-Sonic-ID: 99dfe5fe-d7dd-4022-a633-711a9deceddd
Received: from sonic.gate.mail.ne1.yahoo.com by sonic309.consmr.mail.gq1.yahoo.com with HTTP; Wed, 11 Jun 2025 21:19:50 +0000
Received: by hermes--production-bf1-689c4795f-x8q2d (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 64c1e2fe68fd12a6b1755d3c37cec48f;
          Wed, 11 Jun 2025 21:09:41 +0000 (UTC)
Message-ID: <10895316-e3fd-4483-9986-a6bcb217b20a@netscape.net>
Date: Wed, 11 Jun 2025 17:09:39 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] x86/its: explicitly manage permissions for ITS pages
To: Mike Rapoport <rppt@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>,
 =?UTF-8?B?Su+/vXJnZW4gR3Jv?= <jgross@suse.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 Xin Li <xin@zytor.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, x86@kernel.org
References: <20250603111446.2609381-1-rppt@kernel.org>
 <20250603111446.2609381-5-rppt@kernel.org>
 <20250603135845.GA38114@noisy.programming.kicks-ass.net>
 <aD8IeQLZUDvgoQZm@kernel.org>
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <aD8IeQLZUDvgoQZm@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.23956 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 6/3/25 10:36 AM, Mike Rapoport wrote:
> On Tue, Jun 03, 2025 at 03:58:45PM +0200, Peter Zijlstra wrote:
> > On Tue, Jun 03, 2025 at 02:14:44PM +0300, Mike Rapoport wrote:
> > > From: "Peter Zijlstra (Intel)" <peterz@infradead.org>
> > > 
> > > execmem_alloc() sets permissions differently depending on the kernel
> > > configuration, CPU support for PSE and whether a page is allocated
> > > before or after mark_rodata_ro().
> > > 
> > > Add tracking for pages allocated for ITS when patching the core kernel
> > > and make sure the permissions for ITS pages are explicitly managed for
> > > both kernel and module allocations.
> > > 
> > > Fixes: 872df34d7c51 ("x86/its: Use dynamic thunks for indirect branches")
> > > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > > Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > > ---
> > 
> > How about something like this on top?
>
> Works for me :)
>
> > --- a/arch/x86/kernel/alternative.c
> > +++ b/arch/x86/kernel/alternative.c
> > @@ -121,7 +121,6 @@ struct its_array its_pages;
> >  static void *__its_alloc(struct its_array *pages)
> >  {
> >  	void *page __free(execmem) = execmem_alloc(EXECMEM_MODULE_TEXT, PAGE_SIZE);
> > -
> >  	if (!page)
> >  		return NULL;
> >  
> > @@ -172,6 +171,9 @@ static void *its_init_thunk(void *thunk,
> >  
> >  static void its_pages_protect(struct its_array *pages)
> >  {
> > +	if (!IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
> > +		return;
> > +
>
> But modules generally use STRICT_MODULE_RWX.
> Do you want to make the its pages stricter than normal module text?
>
> >  	for (int i = 0; i < pages->num; i++) {
> >  		void *page = pages->pages[i];
> >  		execmem_restore_rox(page, PAGE_SIZE);
> > @@ -180,8 +182,7 @@ static void its_pages_protect(struct its
> >  
> >  static void its_fini_core(void)
> >  {
> > -	if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
> > -		its_pages_protect(&its_pages);
> > +	its_pages_protect(&its_pages);
> >  	kfree(its_pages.pages);
> >  }
> >  
> > @@ -207,8 +208,7 @@ void its_fini_mod(struct module *mod)
> >  	its_page = NULL;
> >  	mutex_unlock(&text_mutex);
> >  
> > -	if (IS_ENABLED(CONFIG_STRICT_MODULE_RWX))
> > -		its_pages_protect(&mod->arch.its_pages);
> > +	its_pages_protect(&mod->arch.its_pages);
> >  }
>

I tested the 5-patch series without this 6th patch on top of 6.15.2 released yesterday
and it fixes a crash I get in 6.15.2 in my Xen PV dom0 without this patch set.

I also  tried this 6th patch (including Mike's suggested removal of the three lines from
Peter's add-on 6th patch ) but I got a kernel panic in Xen PV dom0 with this extra patch.

Chuck Zmudzinski
