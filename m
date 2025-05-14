Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553D352F88;
	Wed, 14 May 2025 14:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747233659; cv=pass; b=YogHSggcIfGP+3cvceVIP0XO8A+1r+jT9hDidvxrjCLSl1BE+7yyuNEsmFtJsLv1NV/tuO+SU7TfW3oGytuXvT4gs8UYhBXjaQ2abXJYRLIZnxp3I3qoN4sK9YC77/cFt/6PE319sW67iK93rnOfiDuvWPr+QTk2XmRG4Jk7Q60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747233659; c=relaxed/simple;
	bh=0c83d2w4up38WYiLqe4rd4DT9kdc0wUmuTY9Wxo+lJw=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=LR0JC8IKTrjtiC63fgXRXL1T14qDAWVOWo4uJWGqnuKUpjFqsTKbdX6gbFxQCoMHkMlLpGMiayFqJxDSE0HMrs6nExAb4raW/BksX81p/AabTDW8f9l3kDIyOUAoxYlyoBcpd20I/D+3UtBI8sG2eB69SwY3+lw9CIyqrRjcwDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=TAw2fi+T; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="TAw2fi+T"
ARC-Seal: i=1; a=rsa-sha256; t=1747233634; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MtO8KegtooDdBrJ+M1QL6UKocX0HfqS5g1u/EiYxON7/lfESJj5pv2w/NJeOXQrG5uO1jgQPS2tKqx8mJ/rlm+kkIp46Wb9dwLjaL+jTxQAyX/pC5DB6BcRlvttuCI5qty6THRP1B1UYRB7ATl9aI5satdW146JYMOkoiaM0k8Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747233634; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zvmLeQwvJW8Kb01T+DUC0a0dVewvRUOUqmlkWNLJ16k=; 
	b=HNpcWehCoHJ53LTKhHa964QwGLX2oKesvKeGFUeg2KF3I2Qd0Xps4kvdjvK7uokiGaT+lKShDk83FNbNHQwX0bEAs0W6Awzpef8giSg1PjnXEv8McKWgJG7/PGyOR7Gb4KpJP6QZIalDapMgprwbO59HSoGPJCCEQMSWbgUbpHE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747233634;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=zvmLeQwvJW8Kb01T+DUC0a0dVewvRUOUqmlkWNLJ16k=;
	b=TAw2fi+T1jNZNUKSQpHuTuy/a47Hk9wt6jEz+PoKZ0tsoJCPCCPvYAC3UDBjjzmr
	LZxMQmiRPIsKt6RfgCvivwocfzSC0VQyHM6N+ZfP/QAVhfrMsajQbP0LXSL8Es6CJWP
	8A/d0+B+SuBL8NDz+UkSsANCuiWqLrupxQGlIWvY=
Received: by mx.zohomail.com with SMTPS id 1747233631513277.34552553411754;
	Wed, 14 May 2025 07:40:31 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [PATCH v3] rust: regulator: add a bare minimum regulator
 abstraction
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <D9VXPNT4HNXP.1PKET0Q1H7O9Y@kernel.org>
Date: Wed, 14 May 2025 11:40:15 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <52CFFCA2-F253-49F1-9EA5-2865BD094B25@collabora.com>
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
 <D9VATLUHDGU8.53I80TGVRV0J@kernel.org>
 <B288AFB1-BA0A-4383-9823-EAC9E5DCA59F@collabora.com>
 <D9VXPNT4HNXP.1PKET0Q1H7O9Y@kernel.org>
To: Benno Lossin <lossin@kernel.org>
X-Mailer: Apple Mail (2.3826.500.181.1.5)
X-ZohoMailClient: External



> On 14 May 2025, at 10:57, Benno Lossin <lossin@kernel.org> wrote:
>=20
> On Wed May 14, 2025 at 3:01 PM CEST, Daniel Almeida wrote:
>>> On 13 May 2025, at 17:01, Benno Lossin <lossin@kernel.org> wrote:
>>> On Tue May 13, 2025 at 5:44 PM CEST, Daniel Almeida wrote:
>>>> diff --git a/rust/kernel/regulator.rs b/rust/kernel/regulator.rs
>>>> new file mode 100644
>>>> index =
0000000000000000000000000000000000000000..7b07b64f61fdd4a84ffb38e9b0f90830=
d5291ab9
>>>> --- /dev/null
>>>> +++ b/rust/kernel/regulator.rs
>>>> @@ -0,0 +1,211 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +
>>>> +//! Regulator abstractions, providing a standard kernel interface =
to control
>>>> +//! voltage and current regulators.
>>>> +//!
>>>> +//! The intention is to allow systems to dynamically control =
regulator power
>>>> +//! output in order to save power and prolong battery life. This =
applies to both
>>>> +//! voltage regulators (where voltage output is controllable) and =
current sinks
>>>> +//! (where current limit is controllable).
>>>> +//!
>>>> +//! C header: =
[`include/linux/regulator/consumer.h`](srctree/include/linux/regulator/con=
sumer.h)
>>>> +//!
>>>> +//! Regulators are modeled in Rust with two types: [`Regulator`] =
and
>>>> +//! [`EnabledRegulator`].
>>>=20
>>> Would it make sense to store this in a generic variable acting as a =
type
>>> state instead of using two different names? So:
>>>=20
>>>   pub struct Regulator<State: RegulatorState> { /* ... */ }
>>>=20
>>>   pub trait RegulatorState: private::Sealed {}
>>>=20
>>>   pub struct Enabled;
>>>   pub struct Disabled;
>>>=20
>>>   impl RegulatorState for Enabled {}
>>>   impl RegulatorState for Disabled {}
>>>=20
>>> And then one would use `Regulator<Enabled>` and =
`Regulator<Disabled>`.
>>=20
>> This seems like just another way of doing the same thing.
>>=20
>> I have nothing against a typestate, it's an elegant solution really, =
but so is
>> the current one. I'd say let's keep what we have unless there is =
something
>> objectively better about a typestatethat makes it worthy to change =
this.
>=20
> I'd say it's cleaner and we already have some APIs that utilize type
> states, so I'd prefer we use that where it makes sense.
>=20

By the way, IIUC, regulator_disable() does not disable a regulator =
necessarily.
It just tells the system that you don't care about it being enabled =
anymore. It can
still remain on if there are other users.

This means that Regulator<Disabled> is a misnomer.

Also, the current solution relies on Regulator being a member of
EnabledRegulator to keep the refcounts sane. I wonder how that is going =
to work
now that Regulator<Disabled> is obviously not a member of =
Regulator<Enabled>, i.e.:

impl Drop for Regulator<Enabled> {
 fn drop(&mut self) {
  regulator_disable(); =20
 =20
  // We now have to call this explicitly, because no one else will call =
it for
  // us.
  regulator_put();
 }
}

impl Drop for Regulator<Disabled> {
 fn drop(&mut self) {
  // We now have to repeat this in both destructors.
  regulator_put(); =20
 }
}

Just to confirm: is that what you have in mind?

=E2=80=94 Daniel=
