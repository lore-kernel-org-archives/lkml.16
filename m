Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D01B27B4F4;
	Tue,  6 May 2025 11:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746532281; cv=none; b=Pt57D14qY8bbHjnoiGf5kF/UO7BIu9GEglg+DvihvVMJKykiAyzX6PSSddoFD4fswLOr677qrLKqI8WBpYA/IxHSWjYnJoFFR7ryNoHPF8KyGsRuLN9cTtns0U7SoKiIwQZq7w4QN6onA8rY0wERhcfjYSu3K+iS22AsycmJfeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746532281; c=relaxed/simple;
	bh=cCuxWpiYYQTcQFZoQpnwaVPEjcFY17Qb4wklWzMy24M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BxOqIn/vgfdZiQ3f2R2YLa28hC3rNnfzAoSvO/w3rpYE5dzyh82EY4jaT2KpKUgzg5+oGadHSRCn67VlEfzI9ylyGrjqwM4h2s2lWPn2Qt9xW9Jx1hCgw2i9PizIuP4VV0IIGqu98lgxt6e03mdKdpwtYQH3LwLPTFCN9Fic/9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=usJWoeU2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="usJWoeU2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF5F9C4CEE4;
	Tue,  6 May 2025 11:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746532281;
	bh=cCuxWpiYYQTcQFZoQpnwaVPEjcFY17Qb4wklWzMy24M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=usJWoeU2plhK+JJTu+tuUiSCKX8ObnXGg2tn9qT3oZPyS4Nb/IrJW5hLIjfwEvk5Y
	 FzcC6hMlsApsQWeGo7flGOjaJJYB0axZ56CZH027+OlkyS9IXc5BlAevCX0viXM/LI
	 UOka+jVk1JddEDEHsqsuHggCo4hqunfS5YAC1IbNMTfKG7pfOgjsjQ3WclRKTrl+hC
	 EzjZpLHOzXwtIuznjY108MHxyW/76NpjMn/vM5IidiKn172prSrvJL4kcEUf5pdR7e
	 Yu+3LCZhx48tpFi2OtRtlPtdp6/trvGfeXEMnHiRhn/gO8pAdw3szEGqcZI+GCD/OT
	 rdeBPNtD8/+WQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>,  "Miguel Ojeda"
 <ojeda@kernel.org>,  "Alex Gaynor" <alex.gaynor@gmail.com>,  "Boqun Feng"
 <boqun.feng@gmail.com>,  "Gary Guo" <gary@garyguo.net>,  =?utf-8?Q?Bj?=
 =?utf-8?Q?=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno Lossin" <benno.lossin@proton.me>,
  "Alice Ryhl" <aliceryhl@google.com>,  "Trevor Gross" <tmgross@umich.edu>,
  "Joel Becker" <jlbec@evilplan.org>,  "Peter Zijlstra"
 <peterz@infradead.org>,  "Ingo Molnar" <mingo@redhat.com>,  "Will Deacon"
 <will@kernel.org>,  "Waiman Long" <longman@redhat.com>,  "Fiona Behrens"
 <me@kloenk.dev>,  "Charalampos Mitrodimas" <charmitro@posteo.net>,
  "Daniel Almeida" <daniel.almeida@collabora.com>,  "Breno Leitao"
 <leitao@debian.org>,  <rust-for-linux@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 1/3] rust: configfs: introduce rust support for configfs
In-Reply-To: <878qnaq8ke.fsf@kernel.org> (Andreas Hindborg's message of "Tue,
	06 May 2025 13:31:45 +0200")
References: <20250501-configfs-v6-0-66c61eb76368@kernel.org>
	<20250501-configfs-v6-1-66c61eb76368@kernel.org>
	<ELsEgktE6XbGxDyusumtuVzyX-eotyYuQdviHTZaIxN7KZaGFr0fNqrv5tac_gYWfbDZYNTC-wQyQuxnmufA2g==@protonmail.internalid>
	<CANiq72mS_HV5rDjP+t+k0jX9QeAgF2SB9_xX54iEBTH-GoPuEg@mail.gmail.com>
	<87msbw1s9e.fsf@kernel.org>
	<86-cT9dBPpEIyQXWVCeEmj3TRvBm6Ta0p1B20sSngRGOqOuC96i6hG3Q9Hg3bN8AQTCPXlsxg_C5Ok0G4JJzpQ==@protonmail.internalid>
	<CANiq72nd0Pfv4TrpULGQ_fZkyBpHyVVZ1H45_RJBgBxkJuzCJQ@mail.gmail.com>
	<87h62419r5.fsf@kernel.org>
	<FLMJjrvUlrMEWy7KzihcYUt-V1IFyP8nt9KYysmVPsWdxUR9dRVXsRoSBw4Z0oFX8tzfWieBDkP7YPAHOXtFcg==@protonmail.internalid>
	<CANiq72miL3eZ40ujmA-pXCqMS8y2AzJQ1UKpL1_hX03AJ0fteQ@mail.gmail.com>
	<87bjsc154u.fsf@kernel.org>
	<CANiq72=SD9ogr+RpPK7E+cFmn2qAVu+MBCoChdp8-hw7JFu6zA@mail.gmail.com>
	<TbTextfZAMlWFS5cWlUE-Wtnp1bv8P783IQQbWUcnHvEgBjpIxukMngLdPkqNR9jWT9O_OtOY1ejin9JoOnsww==@protonmail.internalid>
	<CANiq72m8VWKRyFai0Xg8AZUTjG0eUVG8nY-ZCQOqOnvwsW0ZaA@mail.gmail.com>
	<875xij1ouy.fsf@kernel.org>
	<m9-XLEt04AwLCzToZZoXspXzPC6RJkp8ht7DnkVuEEPHQ02CjS0SNIKyKM1gsH-QfZruoYixHlsAHzfYyNEykw==@protonmail.internalid>
	<CANiq72m0cuf5YKfOY8oNg83dzWEqqyddGKKh_6fwQQ4hoCp+yQ@mail.gmail.com>
	<87ecx3xzqd.fsf@kernel.org>
	<SwuN4IgGwXbwy3_67Br6ePRhtgh9XOahiVZwowTgUCacTz4Eos44f86aFUJS7rqZfrb2FKhBkKanUDERKBMSmw==@protonmail.internalid>
	<CANiq72nPMH06HURgZJN-o0GMmGdQQpFetm=S5SDEB+B+f0wefA@mail.gmail.com>
	<878qnaq8ke.fsf@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Tue, 06 May 2025 13:51:08 +0200
Message-ID: <8734diq7o3.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Andreas Hindborg <a.hindborg@kernel.org> writes:

> "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:
>
>> On Mon, May 5, 2025 at 9:51=E2=80=AFAM Andreas Hindborg <a.hindborg@kern=
el.org> wrote:
>>>
>>> So I was thinking that because I am initializing a static with a let
>>> statement, it would run in const context. But I see that it is not
>>> actually guaranteed.
>>
>> No, that is actually guaranteed, i.e. when initializing a static. But
>> you aren't initializing a static here, no? Which static are you
>> referring to? If you were, then the "normal" `assert!` would work,
>> because it would be a const context.
>>
>> The `add` calls I see are just in the `let` statement, not
>> initializing any static:
>>
>>             {
>>                 const N: usize =3D 0usize;
>>                 unsafe { CONFIGURATION_ATTRS.add::<N, 0,
>> _>(&CONFIGURATION_MESSAGE_ATTR) };
>>             }
>>
>> So it also means this comment is wrong:
>>
>> +        // SAFETY: This function is only called through the `configfs_a=
ttrs`
>> +        // macro. This ensures that we are evaluating the function in c=
onst
>> +        // context when initializing a static. As such, the reference c=
reated
>> +        // below will be exclusive.
>>
>> Please double-check all this... :)
>
> Oops.
>
>>
>>> Right. Which is why I opted for `build_error`. But with the `const`
>>> block solution you suggested is better.
>>
>> I thought you opted for that because you thought the `assert!` would
>> only work if not refactored. What I tried to point out was that the
>> `assert!` wouldn't have worked even before the refactoring.
>
> I made a mistake in thinking this was in const context. I'll see if I
> can fix that.


I think I can fix it like this:


modified   rust/kernel/configfs.rs
@@ -703,8 +703,8 @@ impl<const N: usize, Data> AttributeList<N, Data> {
=20
     /// # Safety
     ///
-    /// This function can only be called by the [`kernel::configfs_attrs`]
-    /// macro.
+    /// The caller must ensure that there are no other concurrent accesses=
 to
+    /// `self`. That is, the caller has exclusive access to `self.`
     #[doc(hidden)]
     pub const unsafe fn add<const I: usize, const ID: u64, O>(
         &'static self,
@@ -715,10 +715,8 @@ impl<const N: usize, Data> AttributeList<N, Data> {
         // We need a space at the end of our list for a null terminator.
         const { assert!(I < N - 1, "Invalid attribute index") };
=20
-        // SAFETY: This function is only called through the
-        // [kernel::`configfs_attrs`] macro. This ensures that we are eval=
uating
-        // the function in const context when initializing a static. As su=
ch,
-        // the reference created below will be exclusive.
+        // SAFETY: By function safety requirements, we have exclusive acce=
ss to
+        // `self` and the reference created below will be exclusive.
         unsafe {
             (&mut *self.0.get())[I] =3D (attribute as *const Attribute<ID,=
 O, Data>)
                 .cast_mut()
@@ -955,7 +953,12 @@ macro_rules! configfs_attrs {
             @assign($($assign)* {
                 const N: usize =3D $cnt;
                 // The following macro text expands to a call to `Attribut=
e::add`.
-                // SAFETY: We are expanding [`kernel::configfs_attrs`].
+
+                // SAFETY: By design of this macro, the name of the variab=
le we
+                // invoke the `add` method on below, is not visible outsid=
e of
+                // the macro expansion. The macro does not operate concurr=
ently
+                // on this variable, and thus we have exclusive access to =
the
+                // variable.
                 unsafe {
                     $crate::macros::paste!(
                         [< $data:upper _ATTRS >]


Best regards,
Andreas Hindborg


