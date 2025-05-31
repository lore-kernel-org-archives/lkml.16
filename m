Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C63ABE46;
	Sat, 31 May 2025 07:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748677092; cv=none; b=EiZB+3Jld+OawiXPYtYpRmZsQApBSoTPcavpU8yfa5e3hrl940sZWsIqzdmniiF/pUHcKr6RPrKbQPddLfz6e5fq7wYzvhsGG7E2MAcifwxEJxGOW9/L8SpTTqKKdaiLCUj+ABmoM2F5eHlW5zq73E+yftVZ4SFdBwmSlIVC2Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748677092; c=relaxed/simple;
	bh=sOSwqv8iikuP9e7lDjX6UD+qNQoBTAK/pKuD3jZ//KY=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=GSp6mO9FVOzo7VbPhD/gMybEurLSBooeKsOOqTxoLXuqhLzps4mbRhuKTkFGeg87DnWA8n9u2KNuNyx0HnLzk2E19kV3ald0hN1fF6ADdV5GrrXXUOWU1TSzAmfsareuD+Scrn6qKFkTzOUjTDrxDlPv7IWdLKFo6V8sPyBSj10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N/3FjNM9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N/3FjNM9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FFB0C4CEE3;
	Sat, 31 May 2025 07:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748677090;
	bh=sOSwqv8iikuP9e7lDjX6UD+qNQoBTAK/pKuD3jZ//KY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N/3FjNM9jAjzMYG5+ce6LfBiY+E6Yir+b2VSv4x8lOTBiSEz9oiIWi36zxJiZXSHV
	 2K05+jPMli7x/uFzbB3gQ3DT9fBFpCNcBYSmXZly9553FocdCBhR5qdl36KvAtQ0d6
	 HKvSiG6wbh2A67qa4sDS5HcJBuwE1WWoCOemFQy1geJytG4S2L6dkIVZ22GzkRnGMW
	 dVt8GweELAgKOWh+ALOJ3gaCgIbY5uZ00F8dMMZaDWDl1lcDBKdqE1mPsjNjJ9kLV/
	 baiZfKFes5vdPzcoxEhzdlStewwAeIUfpAZ8S0YROFjzvGiRT25ZQZ9KrSgYucDA42
	 bAyhcTE6IeosA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 May 2025 09:38:05 +0200
Message-Id: <DAA6AJ0N7JAA.WCEOCHKVFLDD@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: "Sai Vishnu" <saivishnu725@gmail.com>, "Miguel Ojeda"
 <miguel.ojeda.sandonis@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <dakr@kernel.org>,
 <gregkh@linuxfoundation.org>, <daniel.almeida@collabora.com>,
 <me@kloenk.dev>
Subject: Re: [PATCH] rust: doc: Clean up formatting in io.rs
X-Mailer: aerc 0.20.1
References: <20250530123129.31505-2-saivishnu725@gmail.com>
 <DA9QL5A8747E.17QE50WBD6JOT@kernel.org>
 <CANiq72npoVzz01syorhUcED=tcs9FJf8bFHthFrUQ-bE-AXJ8Q@mail.gmail.com>
 <CAFttn54qYu3ajcBPWWnhjAS-6pQ8Ox3ujbTF6D=Q_BOMkTLq6g@mail.gmail.com>
In-Reply-To: <CAFttn54qYu3ajcBPWWnhjAS-6pQ8Ox3ujbTF6D=Q_BOMkTLq6g@mail.gmail.com>

On Sat May 31, 2025 at 4:57 AM CEST, Sai Vishnu wrote:
> On Sat, May 31, 2025 at 1:09=E2=80=AFAM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
>>
>> We should also probably add "region" there, after "memory", or
>> similar, especially if we remove the second part.
>
> Thanks for the feedback! I=E2=80=99ve decided to update the comment to ju=
st:
>
> /// IO-mapped memory
>
> I=E2=80=99m new to kernel development. Should I just share the updated pa=
tch
> here or send a v2 that refers to this one? Thanks!

Normally, you send a v2 with a changelog and a link to each previous
version. For patch series with a cover letter it is often placed there.
Since you don't need one, you should put the changelog after the `---`
(anything that isn't a diff there will be ignored by git when applying).

I'd give others a few more days to review. (this patch there most likely
won't be any additional comments, but it also doesn't hurt)

---
Cheers,
Benno
