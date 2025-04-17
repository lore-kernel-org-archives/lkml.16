Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62377239588;
	Thu, 17 Apr 2025 11:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744888705; cv=pass; b=aGCPsaHx0xyYp06Tkn0YMZ7KoBoglByFqpDjBlYHO5WrmOQ6tyYQvfR2lYM148bQSy+oyybaNNPBDUmNa+PA9lfTx9GvTZ9kepUB27S+QHSzHJ8VFN1XblmotMUkPvdi0mvCeiIMQdwYGN1AYbQPLuy9LrMhVpeYxOvj5+Xsz9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744888705; c=relaxed/simple;
	bh=g3n8qbuXH6LCUlQ+Gf+tgFZRbHSsQBpiI2ikcrzfzEE=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=jxBPSL5tMh05MelNDcyD630nPsrQ5V7ZIGk9mGjrvzQS1CCq7GZm3yPcUs3DkSOIZ/Fld1KtSwtuYZAhRIGOg2oTeRKDTaY7Qsun79LG5HLnIFYsQk1N2JFXr0QdtFRvILyWwS/bnGy8G324xnWbxRsz+Esu9SJ8WCaGruEpgGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=MuXm5JFC; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="MuXm5JFC"
ARC-Seal: i=1; a=rsa-sha256; t=1744888673; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CQ18dQ3tN4r2M3/Ux1SXUdBjlzAw1Vt6vjawvhnvoOOV+mKFXfT6sHqe5qNVSwq/9cBbia7X3H828LbnathXiRIZeQBKaD2ezdx+6T8a09wDXaSTdB0wK8SdnZvuWv/n2CnwKSwOsQOixrSNPZhDPpO/hfIbsuC977FCLYv2+w0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744888673; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=B3vHgcOcDvV9fe66m4M7950Oh2PXKr33rDoJYxpZcH8=; 
	b=VSFVSVX4vZ3tyW72g/zUs9f7xOp3kvfn/oCn8zUZ6X1C5Tg0B0kJtf2lAGwlBX/C2QyUUCI5aADpWcafm48QppOwi2G5vWXHCgJK/5AEV5pb72BGzINergz9xVtdZiVVdxMqtjV4Ovs0lsihpQSWJpPSfVQn0lQBPglmAF77ZLU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744888673;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=B3vHgcOcDvV9fe66m4M7950Oh2PXKr33rDoJYxpZcH8=;
	b=MuXm5JFCd87w3ohq7nh0VmJ0vrTyQ39c1OCLAwrLsgXfE2KXKVCWF9h4h/6w9yH8
	HbFPx/KGyi8eQDVBa4HyWax8ua/XyJbaSj73/u/aNdFlOvN9JN7YSNIBrmYlDfeE7MI
	MhKwecRBasuEG0U3GDPd4oMRRYv1YJrreATPMZwo=
Received: by mx.zohomail.com with SMTPS id 1744888670925391.69631041570995;
	Thu, 17 Apr 2025 04:17:50 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH v5 07/13] scripts: generate_rust_analyzer.py: avoid
 optional arguments
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <CAJ-ks9=UwmdZqVnvJ8dzASG2hjtWFS=PAM2jAtWpEuZ9Lu5f+w@mail.gmail.com>
Date: Thu, 17 Apr 2025 08:17:28 -0300
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
 Boris-Chengbiao Zhou <bobo1239@web.de>,
 Kees Cook <kees@kernel.org>,
 Fiona Behrens <me@kloenk.dev>,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Lukas Wirth <lukas.wirth@ferrous-systems.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C58B27D5-7F61-46D1-84F3-CC69E01EF5C4@collabora.com>
References: <20250325-rust-analyzer-host-v5-0-385e7f1e1e23@gmail.com>
 <20250325-rust-analyzer-host-v5-7-385e7f1e1e23@gmail.com>
 <CCB6D89D-D513-4514-8992-AC37313F5588@collabora.com>
 <CAJ-ks9=UwmdZqVnvJ8dzASG2hjtWFS=PAM2jAtWpEuZ9Lu5f+w@mail.gmail.com>
To: Tamir Duberstein <tamird@gmail.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-ZohoMailClient: External

Hi Tamir,

> On 1 Apr 2025, at 10:34, Tamir Duberstein <tamird@gmail.com> wrote:
>=20
> On Tue, Apr 1, 2025 at 8:59=E2=80=AFAM Daniel Almeida
> <daniel.almeida@collabora.com> wrote:
>>=20
>> Hi Tamir,
>>=20
>> This patch looks good to me but,
>>=20
>>> On 25 Mar 2025, at 17:06, Tamir Duberstein <tamird@gmail.com> wrote:
>>>=20
>>> Make all arguments required to reduce the probability of incorrect
>>> implicit behavior. Use keyword arguments for clarity.
>>>=20
>>> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
>>> ---
>>> scripts/generate_rust_analyzer.py | 90 =
+++++++++++++++++++++++++++------------
>>> 1 file changed, 62 insertions(+), 28 deletions(-)
>>>=20
>>> diff --git a/scripts/generate_rust_analyzer.py =
b/scripts/generate_rust_analyzer.py
>>> index b37d8345486a..badcef4126cf 100755
>>> --- a/scripts/generate_rust_analyzer.py
>>> +++ b/scripts/generate_rust_analyzer.py
>>> @@ -69,9 +69,10 @@ def generate_crates(
>>>    def build_crate(
>>>        display_name: str,
>>>        root_module: pathlib.Path,
>>> +        *,
>>>        deps: List[str],
>>> -        cfg: List[str] =3D [],
>>> -        is_workspace_member: bool =3D True,
>>> +        cfg: List[str],
>>> +        is_workspace_member: bool,
>>>    ) -> Crate:
>>>        return {
>>>            "display_name": display_name,
>>> @@ -92,21 +93,34 @@ def generate_crates(
>>>    def append_crate(
>>>        display_name: str,
>>>        root_module: pathlib.Path,
>>> +        *,
>>>        deps: List[str],
>>> -        cfg: List[str] =3D [],
>>> -        is_workspace_member: bool =3D True,
>>> +        cfg: List[str],
>>>    ) -> None:
>>>        register_crate(
>>> -            build_crate(display_name, root_module, deps, cfg, =
is_workspace_member)
>>> +            build_crate(
>>> +                display_name,
>>> +                root_module,
>>> +                deps=3Ddeps,
>>> +                cfg=3Dcfg,
>>> +                is_workspace_member=3DTrue,
>>> +            )
>>>        )
>>>=20
>>>    def append_proc_macro_crate(
>>>        display_name: str,
>>>        root_module: pathlib.Path,
>>> +        *,
>>>        deps: List[str],
>>> -        cfg: List[str] =3D [],
>>> +        cfg: List[str],
>>>    ) -> None:
>>> -        crate =3D build_crate(display_name, root_module, deps, cfg)
>>> +        crate =3D build_crate(
>>> +            display_name,
>>> +            root_module,
>>> +            deps=3Ddeps,
>>> +            cfg=3Dcfg,
>>> +            is_workspace_member=3DTrue,
>>> +        )
>>>        proc_macro_dylib_name =3D (
>>>            subprocess.check_output(
>>>                [
>>> @@ -133,66 +147,75 @@ def generate_crates(
>>>=20
>>>    def append_sysroot_crate(
>>>        display_name: str,
>>> +        *,
>>>        deps: List[str],
>>> -        cfg: List[str] =3D [],
>>> +        cfg: List[str],
>>>    ) -> None:
>>> -        append_crate(
>>> -            display_name,
>>> -            sysroot_src / display_name / "src" / "lib.rs",
>>> -            deps,
>>> -            cfg,
>>> -            is_workspace_member=3DFalse,
>>> +        register_crate(
>>> +            build_crate(
>>> +                display_name,
>>> +                sysroot_src / display_name / "src" / "lib.rs",
>>> +                deps=3Ddeps,
>>> +                cfg=3Dcfg,
>>> +                is_workspace_member=3DFalse,
>>> +            )
>>>        )
>>=20
>> Why the change from append to register+build here? Maybe this change
>> should be in another patch?
>=20
> The reason is that `append_crate` has lost its `is_workspace_member`
> parameter, so the only way to pass `False` now is to use
> `build_crate`. I chose to remove the argument from `append_crate`
> because the alternative would have introduced many instances of
> `is_workspace_member=3DTrue`, which I judged to be less-good than =
this.

Fine with me.

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

>=20
> Cheers.
> Tamir

=E2=80=94 Daniel=
