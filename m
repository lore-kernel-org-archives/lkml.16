Received: from sonic309-27.consmr.mail.ne1.yahoo.com (sonic309-27.consmr.mail.ne1.yahoo.com [66.163.184.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A715C846F
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 20:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.184.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738786706; cv=none; b=qgdceSqbl+YsU0ygmpl93KqpYiigF9FbTnwSxbZeDPJhjO0FZiN2/jI+Cvh/iSdOifnt9m0NotXqtKpk4ZLl6iL3bXBxgqs2s4lD3OJOc0zr2CDAaCdOgYvIgETMNJixqMMl2lURY5DOTtfB2jNARchPFuGg011V7PgdLiijbSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738786706; c=relaxed/simple;
	bh=GyinHwZe8l8Vi7MU33cbGhjcYr+B/fP539pvAqUKvyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HanKPoCNChhAu3OlHWV3flnwJZpk2ZWS4IwbQXXYl2952LTy1fihaMTE6PbqK2wNaky5HwhYCSDksSjuj0WqevGaj7JqKUqTmgFMeRIh4TtcVpSCeIdZJlidf3ICv8Fpb5Bac9QrnR4ri0QeanE86gC9Ywk05QWBF+V8ITuF2MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=schaufler-ca.com; spf=none smtp.mailfrom=schaufler-ca.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=WZgXc88s; arc=none smtp.client-ip=66.163.184.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=schaufler-ca.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=schaufler-ca.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="WZgXc88s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1738786702; bh=CLjgbZKkokNQfxmqa8wmo+WBOSfGgBAwI37IDASOPw4=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=WZgXc88swl65jUJj8k5uNvjIqJ96s9CBw+XqbhOFseIUr39EXUn1qGw9SOKy2DwCcsEi/js7cTJnukOzzQc+HXhWstEepGmRInO6orokycanXhxgg7IkGyCWbe3aj4i2Ca4mqkQsdRl/WaQ88Wr5z9Y6N2gPmbIOHrpKZ/f2fjFcqVinIAjMQbO0Nkf73vacxC6f9Lne0nZjkikwvsYKibZfx1ItyuOZJHq8JdwbmV0ZRC8otUY55UOH2JDPWOnve0oujR1FGoPcP6/76wOluN7Ne/GFQ82BNQyEUrLaxiL4LgtxwcBhuyfME5dAJTJwH9hqw6B6UZstW2ewP3I8Rg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1738786702; bh=arFU5DeFhWcM9HDrsbtIKW36fgk0/YyvBCtRTgVqA8i=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=DoaVikjOckELN4gBTrnS5sMNSeZrm6MMK0qdhxPVwOJd/ohNhkzVAUwFJKWgNFOikC7C8q4Dg6XET2JjIX9OlBJVhS12bd8gBF7UDYg4oIh7dnekfMJPDqBrC7hBDBxt5igJiG7HUQbZ6v9ZCIc+VFTeU9ugTBW+dF8IzFuQpZtQW9b7hrVwTfhuDMNL+7wDJr4Z7oAyp440slOco3Q3D6msTCe+SdrThz4sCUktuOvr2y1iPTnQpXmZzFumnhu0hFuuuxID2xeU0pLteGt8aynENrz8o81r+0E4aWYVZfqZC3tKbDx+pJLN5x75mrgshbMPPwpIc8anL0v3d0FPzw==
X-YMail-OSG: 4WyXT9AVM1mRoPW9fIAqfTM5AsJmDPiXD2rci3Wg6TTODx1wuipD72v1iYtliv1
 IwGuOESn7VQV5m4eoS9Mo.xF3yYBTAE8BgynDp4fIGhTSdJwCTxk_TfV.8LIyt6pyIlSJvNLQseS
 8dgQS5v1.afuirOFF81qAtBkpwr5HE2bZ7XVWoDS4P9tpbq1L2tM8QJmCudqilSH8EWz9XWi82ym
 4ZOP3PyDY2HbttIJ859XLBAmY3rjWzRulpI0ZYd_OcxMtwn4JytaUTqASkRHqZHYbunVsPxS_cy.
 6xglSgjdBfJcKRGoIsNcfRehfArSks.4R3U18r8UijizpLNKaHz0Moks4RfIxbR6OKqj0eLHXKwH
 _Fg45lW19r_NyPFrLW6mzEnPfu5Sdn99kCtoCjT.7JKnDTErx6ywzigw0_Nl46Gn7Cz4vwz0MONj
 4n_FitpHMjCYJClAtg9qgvZmwZOIdNPojy38_opG02TVzwRZ5DXyvuu3tyG3spfLOYD3JbPx4gRL
 jFD131nxavIB0TU2Sd1U8jFDzGV1Gr6na5MWi71do1IW5G4Wip_uc3r1QookG_CO54aeBTo46IdH
 3xWeuLS7SuhqdkqZKGmJyhtZmwpk2TjkrXB44rCtsl4dUipwq_U1meV.Cfx.R7_bHPRqJyP.ri8w
 5s9pvDSyOFr04JleyyKYnCxJr1JTIjSDlPjyOEM64iEOQH1jFm6DhRuZGHEIwdtnoWJJfuJD8VEP
 5jElVnKr69dkEJRlZLDEqeZS9DelaG19_gV9QEIaR6ug5RPGdqgesmIlA86RsmAsVUw9YEDVeoD3
 1YAkh_Oid9nKUxb9Tk9XK1kviHcrETjCWZLsIU.eNaw19nH21EydeZ2ayH8ilMoM435YHS1pKBGm
 jNldKA_C7nLIEpIjd.kOP6WDFBEYrXvK4gIDTUd_2dok5qrC1wyfQgDCARwfeKFiML2I6sh4jonY
 ukB7ndz9VA7ug2zdoE3_QmjoGMZWv1ZAvedJQyo0d.a5ZUy7ud9BUbsqkvHfpGYyHh1QTyUGsl1U
 Xwku0oqJ4fGogNmMcbkr28DXZIT9Z6eN1ooXYfy15l9tVeU3EOsqRU4SZStFofeJGwVSjxotol9A
 LhQVPZZr74526rwN1NVeNOCpAroh4AublDRyNoi3ctxZ.gDkD6amSOUOwwETa6tCeQyV2iMWEhxU
 LWZ6zQuIGnlxUYww5sDn_oe33BYbmw9xReqIrAiEYGArMvRl_9W8cbxKQeeClT7eWcWQlZGLaLZ4
 MpkEiYJWfSo8Wyfp_oePhZQdunUue9Wr5dmlZQbjaFlDg1_T0xwCE2y03djLogA769hT3Pf95n.K
 9ZObA5ci8V6eqZMeS.uyxR4wis6EDqCeecJW8AP.rwQGyE9geYbQ2NT5I1zxLds3hyVb13weMAMa
 hkuln1PqDbs1MBZBs2eEkUvetAKaXZM0oFkuCFh_..oLghNYXatUSdXCdqxvQA6sU8BIuV2Y0GO1
 ZrfyZ7KoUF9kembdKbBuvNaKzMGqECqJ.rRMgwUkL_mNo1AlgeaN_Um1AXf2egHhuUMOAFJbazS9
 YlGga4FcXYqrOXbEwTvIsoVfhH2BeuGFiDpF3gEMODRHBMSyb52uU3c29I4tYnkJuwytJPkSVHc6
 4tqFtA0DGom8rDgW87zjHVQXVgB26gD6753ZVp6GRuOyvFttlyEhavjzmemb.SfZmTgd010c1__i
 uA6v5xRPePgYDPQOxpm_SP0fjxM1bF.6SsoqSmOCKQ.GNxD_RFYuaZIeNR1q415oLf4dMZ_x8.7d
 FnWvztoy7AYMkY6Qa3Pl3L9JbUqOKqvr2fbHtQsOCccpJq0_1Vzbe4QWtugEa_GJieEkxlSAMpyS
 TrrquMC1Hstg4RgHELzPZm4INMiowdN7yiuI_kO3VXMnoh3dBw1W3zxACC8ja_OFxyzrYQaPu5m5
 vmzy0F4aJy7TQGQUaAxCnmPlKc_YjrX1KQS2GglbUB6Jgswt6vbwA6LDpHWm7QoznE4URq1K7nyO
 6tlhOBlfwxTtmdIRvf6QEfXqx_8F_G9WfZWmBsmKeEPmbiBX0lyeyVxzmGhNMWRs_LEMHkAeqHRY
 xTSJagJqpWL3S.59_0AXSeOoaJsHpr.m4A.if1iPATzQsYV5qZqeWbvk8A2Cf7v6HIXGmbiurt.9
 jToRsp6.v2_aY65GliKDzwYB5gWLkjI0gpH0xoeEiUk7qGijGY2NzoarKqp.jgeIiKGRn6HOgOeb
 6Ivd0TRaYqm3hjMilDjnrH83D0ge_peA10XxgtrAS4nhYvaYTnBlNrDK7QQh3cJubj49Ixdj70eG
 5y2oY00KAjJiNgvc-
X-Sonic-MF: <casey@schaufler-ca.com>
X-Sonic-ID: 4b9bcb52-40ac-4520-90e0-121890c07bc3
Received: from sonic.gate.mail.ne1.yahoo.com by sonic309.consmr.mail.ne1.yahoo.com with HTTP; Wed, 5 Feb 2025 20:18:22 +0000
Received: by hermes--production-gq1-5dd4b47f46-xx4tp (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 8b9872a08a8dbdc8e223172907c786db;
          Wed, 05 Feb 2025 19:58:02 +0000 (UTC)
Message-ID: <e8ec2704-90bf-4e67-9e90-eb206e6d08c0@schaufler-ca.com>
Date: Wed, 5 Feb 2025 11:58:00 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/14] Add TSEM specific documentation.
To: "Dr. Greg" <greg@enjellic.com>, Paul Moore <paul@paul-moore.com>
Cc: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
 jmorris@namei.org, Casey Schaufler <casey@schaufler-ca.com>
References: <20240826103728.3378-3-greg@enjellic.com>
 <8642afa96650e02f50709aa3361b62c4@paul-moore.com>
 <20250205120026.GA15809@wind.enjellic.com>
Content-Language: en-US
From: Casey Schaufler <casey@schaufler-ca.com>
In-Reply-To: <20250205120026.GA15809@wind.enjellic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.23187 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

On 2/5/2025 4:00 AM, Dr. Greg wrote:
> On Tue, Jan 28, 2025 at 05:23:52PM -0500, Paul Moore wrote:
>
> Good morning, I hope mid-week is going well for everyone.
>
> After the issue of the functionality of modern cryptographic
> primitives, a discussion of the second most important issue Paul
> raises.
>
>> I believe the LSM can support both the enforcement of security policy
>> and the observation of security relevant events on a system.  In fact
>> most of the existing LSMs do both, at least to some extent.
>>
>> However, while logging of security events likely needs to be
>> asynchronous for performance reasons, enforcement of security policy
>> likely needs to be synchronous to have any reasonable level of
>> assurance.  You are welcome to propose LSMs which provide
>> observability functionality that is either sync, async, or some
>> combination of both (? it would need to make sense to do both ?), but
>> I'm not currently interested in accepting LSMs that provide
>> asynchronous enforcement as I don't view that as a "reasonable"
>> enforcement mechanism.
> This is an artificial distinction that will prove limiting to the
> security that Linux will be able to deliver in the future.

I'll apologize up front to everyone else for this response, but I
hope it is something you might understand.

A security guard scans a person's access pass. As the computer system that
processes the data is slow, the guard lets the person go through the gate.
An access denial finally comes through. The guard turns and shoots the
intruder. What other choice is available? The intruder may have seen what
should not have been seen. Now the guard has to file a fatal incident report
and slow down everything else while cleaning up the remains.

tl;dr - async access control is just messy.

> Based on your response, is it your stated position as Linux security
> maintainer, that you consider modern Endpoint Detection and Response
> Systems (EDRS) lacking with respect to their ability to implement a
> "reasonable" enforcement and assurance mechanism?

You are conflating issues. It isn't the purpose of the system, it is
the mechanism by which it is implemented that is the problem.

> If this is the case, your philosophy leaves Linux in a position that
> is inconsistent with how the industry is choosing to implement
> security.
>
> Let me cite an example from one of our project advisors.
>
> This individual is a senior principal at a reasonably large technology
> products company that depends on Linux almost exclusively to support
> its operations.  At any given instant he participates in supervising a
> fleet of around 6,000 virtual machines running about 50,000-60,000
> containerized workloads.

How can this possibly be a kernel problem?

> All of the Linux deployments are Ansible orchestrated.  The security
> deployment consists of disabling SeLinux and installing an EDRS
> solution.  Doing the latter checks all the boxes they need for their
> corporate security compliance policies.

Without insight regarding what these policies might be it is impossible
to say for sure, but I'll bet a refreshing beverage that they involve
all sorts of application level protocols, and other things the kernel
has no business moderating.

> He, and others, have watched this discussion closely over the last two
> years that we have tried to get TSEM reviewed and just recently phoned
> me with the following comment:
>
> "I think the problem is that these guys don't understand how security
> is being done and the reasons why".

Oh, make no mistake, I (at least) understand how security is being
done these days and find it terrifying. We do in the kernel what can
and should be done in the kernel, but adding general supply chain controls
as an LSM isn't gonna happen in my (admittedly limited) lifetime.

> There is probably not a modern EDRS solution that does not involve
> going to the cloud for its decision making enforcement,

Wow. The number and density of application and network protocols
necessary for that to work puts an Austrian pastry to shame. And
you want to put that in the kernel?

>  in most cases
> based on Indicators Of Compromise (IOC) trained machine learning
> models.  Asynchronous detection, enforcement and remediation is now
> standard practice.  In the security industry, a 1 minute response to a
> security event is considered the 'gold' standard.

A one minute delay in an openat() call ain't gonna happen.

> For the sake of discussion, lets take a Quixote userspace Trusted
> Modeling Agent (TMA) running TSEM based deterministic modeling of a
> containerized workload.  As we've discussed previously, demonstrated
> average response times are on the order of 170 micro-seconds.
>
> For an event that needs asynchronous enforcement, ie. running in
> atomic context, that represents a 3.5 order of magnitude advantage in
> response over the industry standard, without the attendant challenges
> of going off machine or installing kernel based infrastructure.
>
> What would be the rationale or advantage of denying those that desire
> this type of security option, a 3,500 fold increase in security
> response times?
>
> Let's take another need for running in userspace, trusted execution
> environments.  Support is available in our userspace package for
> running a TMA model in either an SGX enclave or in an independent
> hypervisor protected execution context, both of which significantly
> harden the enforcement implementation against attack by adversaries.
>
> As Linux security maintainer, we assume that you have read Executive
> Order 14144 signed on January 16th 2025.

Remember "C2 in '92"? Executive order. Industry invested ~$25 Million
in 1990's dollars in evaluation costs alone. Never enforced. I am not
shaking in my boots.

>   That document specifically
> calls out the requirement for the increased use of trusted execution
> environments in combination with advancements in endpoint detection.
>
> It shouldn't be a leap in imagination as to the regulatory compliance
> advantages associated with hardware attestation that the security
> implementation is operational and in a known good enforcement state.

When those technologies have developed some level of maturity and
acceptance they'll be worth considering more seriously.

> Finally, at this point in time, it would seem unwise in the technology
> industry, to discount the importance of 'AI', or more correctly
> machine learning.  As we've noted before in our discussions, it is
> unlikely that we are going to see synchronous LSM enforcement using a
> machine learning model trained on potentially trillions of data
> observations and indicators.

I'm not discounting AI. I'm questioning it's use in kernel access control
implementations. You cannot ignore the impact of access control on system
performance. Ever.

> The LSM is designed to provide security services to the users of
> Linux, not to be a kingdom.

It's never been more than a principality. ;)

> Linux is/was about 'choice' as to how users want to use their
> hardware.

Nah, it's about a Finish grad student's side project.

> Artifically limiting the types of security that can be implemented by
> the LSM works to the detriment of the security innovation that Linux
> can deliver and the Linux user community writ large.

If you can demonstrate a sane implementation of your mechanism we're
all ears. User space policy adjudication isn't sane. It wasn't in the
1980's, it isn't now.

