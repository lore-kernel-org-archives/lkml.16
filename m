Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583B2F50F;
	Sun, 18 May 2025 07:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747552777; cv=none; b=SW/PE+OSf3l3nqQW6ieNjmVFIVmqA9vPiDES6Rcm4U7UouOH8N9jfD5u/OIlmvcaZlEjEw0+ySIfhIZFSt9QLu2QlSA8xKHiS6xlbqpwlKjj+t88dxBMQVl41NXtffOqmrknmOACV9PYhv86ZnLdJ+pnHff5V6+xFMmdIcSAo18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747552777; c=relaxed/simple;
	bh=eZTv81uAYSuj3s2veI21xz+VC0/ANUgRdzq9TDNSayA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=r2l9MtSi60cHVoZq+RgJ7CzHwLI0pYsAykUH37KI7CoaPwArNpEneY/U1PRnYMpxzjpUTL5vDAU8gwU7yEQHJTdOlWEetrtkrqi4jiUTsPVQjrkyfO+El/paTQP+z50nfORmWxK2k91fhxZXcdBD67S2fdqqhZXWSplzCnriIUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gr5lXed9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gr5lXed9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C81ACC4CEE7;
	Sun, 18 May 2025 07:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747552776;
	bh=eZTv81uAYSuj3s2veI21xz+VC0/ANUgRdzq9TDNSayA=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=gr5lXed98/psCI6YG1EDjEqbMWClv30in0JVqiv3S0IaaTiKvXuaKsudtuFglt6Jd
	 P259ZRfAb+sa/DZo4VZkVFeMyC37jwswtPFGm8ItrEmfywVJetfNSSoUIi8Ngh2scN
	 gfVKeW6tBulVNNy/aD2s7B5cQUQfOJagSVXoAM4M8yrGpU8M3LQhJd80KW2i05YKga
	 rD5u0y0doe7RvLoniFdEU+susu/2op+g5faDqd+xZ+41c5ESdovMwwQVRl32o5waZm
	 ZdFXZnvaspMU83Z0In7Tine1KsLeBnU+ri/XEhFDTp3vx56mqkrZoTdIdSLUyJyx9Q
	 CrOl5K55eisEg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 18 May 2025 09:19:23 +0200
Message-Id: <D9Z3R4EYAXV9.211IFNRTOPM6O@kernel.org>
Subject: Re: [PATCH v3] rust: regulator: add a bare minimum regulator
 abstraction
From: "Benno Lossin" <lossin@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, "Sebastian Reichel"
 <sebastian.reichel@collabora.com>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Mark Brown" <broonie@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
 <D9YXK1J1XO37.JVILKENRKYXD@nvidia.com>
In-Reply-To: <D9YXK1J1XO37.JVILKENRKYXD@nvidia.com>

On Sun May 18, 2025 at 4:28 AM CEST, Alexandre Courbot wrote:
> On Wed May 14, 2025 at 12:44 AM JST, Daniel Almeida wrote:
>> +//! Regulator abstractions, providing a standard kernel interface to co=
ntrol
>> +//! voltage and current regulators.
>> +//!
>> +//! The intention is to allow systems to dynamically control regulator =
power
>> +//! output in order to save power and prolong battery life. This applie=
s to both
>> +//! voltage regulators (where voltage output is controllable) and curre=
nt sinks
>> +//! (where current limit is controllable).
>> +//!
>> +//! C header: [`include/linux/regulator/consumer.h`](srctree/include/li=
nux/regulator/consumer.h)
>> +//!
>> +//! Regulators are modeled in Rust with two types: [`Regulator`] and
>> +//! [`EnabledRegulator`].
>> +//!
>> +//! The transition between these types is done by calling
>> +//! [`Regulator::enable()`] and [`EnabledRegulator::disable()`] respect=
ively.
>> +//!
>> +//! Use an enum or [`kernel::types::Either`] to gracefully transition b=
etween
>> +//! the two states at runtime if needed. Store [`EnabledRegulator`] dir=
ectly
>> +//! otherwise.
>
> Having the enabled or disabled state baked into the type is indeed
> valuable for drivers that just need to acquire and enable a regulator at
> probe time. However, there are also more dynamic use cases and I don't
> think the burden of managing this aspect - by either performing a manual
> match to call any method (even the shared ones), or implementing custom
> dispatch types (which will lead to many similar ad-hoc implementations)
> - should fall on the user. Thus I strongly suggest that this module
> provides a solution for this as well.
>
> It has been proposed earlier to use a typestate, and this would indeed
> provide several benefits, the first one being the ability to have shared
> impl blocks (and shared documentation) between the enabled and disabled
> states for methods like set/get_voltage().
>
> But the key benefit I see is that it could also address the
> aforementioned dynamic management problem through the introduction of a
> third state.
>
> Alongside the `Enabled` and `Disabled` states, there would be a third
> state (`Dynamic`?) in which the regulator could either be enabled or
> disabled. This `Dynamic` state is the only one providing `enable` and
> `disable` methods (as well as `is_enabled`) to change its operational
> state without affecting its type.
>
> All three states then implement `set_voltage` and `get_voltage` through
> a common impl block, that could be extended with other methods from the
> C API that are independent of the state, as needed.
>
> To handle typestate transitions:
>
> - The `Disabled` and `Dynamic` states provide a `try_into_enabled()`
>   method to transition the regulator to the `Enabled` state.
> - The `Enabled` and `Dynamic` states provide `try_into_disabled()`.
> - `Enabled` and `Disabled` also provide `into_dynamic()` (which cannot
>   fail).
>
> Essentially, the `Enabled` and `Disabled` states simply enforce an
> additional operational state invariant on the underlying regulator, and
> do not provide methods to change it.
>
> The `Dynamic` state would be the default for `Regulator`, so by just
> using `Regulator`, the user gets an interface that works very similarly
> to the C API it abstracts, making it intuitive to those familiar with
> it.

How will the `Dynamic` typestate track the enable refcount? AFAIK one
has to drop all enable refcounts before removing the regulator. Also
what happens when I call `disable` without any enable calls before?

---
Cheers,
Benno
