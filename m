Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0ED4289356;
	Mon, 19 May 2025 18:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747678822; cv=none; b=P6IQ/AFxW4Ri9xvWq127VkXobooaQf/Xgrt3adNyBmbx91hvUjuTVwOO6WRC0sKVXhCDJQ/8JELE6PdP7p9axiJCxvUJaqideD8S3/4JtzvLkbtFKxLnwrYjU1xZ62jBOfthX4gthUsyze52UXstFs9cD2XpWtpziCeP4oFSNkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747678822; c=relaxed/simple;
	bh=akjG8YvnOB2zq0ZknFvA+IHH2QlX/yRMJpYsUw5eo1E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=Fh16XWcGCoidMWdDpWD76p7GQ4V2ljiM4J6Z9SpEJnbfHB8xlmmUt35gTtumF2+dZiR0rkD9b0k1aA9+mE+2h1rPQHOncDZsJeN7JC3s0gciqriu75JPsYDrMmyxhOBX41pNria4qlvpaVNN6w0jjuicICGuxMOk+vwjUJgs1Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fiidyoAJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fiidyoAJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED06DC4CEE4;
	Mon, 19 May 2025 18:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747678822;
	bh=akjG8YvnOB2zq0ZknFvA+IHH2QlX/yRMJpYsUw5eo1E=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=fiidyoAJc0M0kl+sPuWiUmnherhcVTzJqsFK/aKysSvgp7n1pwB4LTj7P7mOW9BBU
	 8bUo/XmXyXPVFvYUAZNQ2+Rj7qJ/7NY/iggXxV9UOi1QC6/E7f+Mo1xSu9JDM7RUTv
	 iGeIWNtCJosalGfi0BLSh19P8+w2hBxuKmMGTWAjS8LCWQbNJLWQ+4msuk+RyhadSR
	 P+spXwutgAGAm6JCsDcc3LiL/dikn4tkONwPU5hFII4OHtP3KdceUT5ho/6mZ9TG5o
	 IeQV/fzUa6++vmraBr4UKARSQjWaPfo7AMGeEfSKhJxv0MuMk/BK4YKE6EYZ8uZ4F/
	 EcEra+2vEzfZA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 May 2025 20:20:18 +0200
Message-Id: <DA0CFPCH6V6N.7MJO1M1XYMLH@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: mailmap: update Benno Lossin's email
 address
From: "Benno Lossin" <lossin@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20250519143952.11412-1-lossin@kernel.org>
 <CANiq72kWV_GGUAnCfZ3-WO+_CqhboDbC4_Q0tE4+UV8kg=uZBw@mail.gmail.com>
In-Reply-To: <CANiq72kWV_GGUAnCfZ3-WO+_CqhboDbC4_Q0tE4+UV8kg=uZBw@mail.gmail.com>

On Mon May 19, 2025 at 6:55 PM CEST, Miguel Ojeda wrote:
> On Mon, May 19, 2025 at 4:39=E2=80=AFPM Benno Lossin <lossin@kernel.org> =
wrote:
>>
>> +Benno Lossin <lossin@kernel.org> <benno.lossin@protons.me>
>
> I think there is a typo here on `proton.me` -- Git will not match it.

Oh yeah, good catch, no idea how that ended up there...


> I can fix it on my side.

Thanks a lot!

---
Cheers,
Benno
