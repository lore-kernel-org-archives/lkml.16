Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA3720B7EA;
	Thu, 12 Jun 2025 07:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749715171; cv=none; b=ddP8J9FpiKpMh4v2fk0V7tvU+6tkqrtm4w9u7mA+OO2bouNtd+7pTquxdNCJfeMYSUiTg/ware0n5nbYCS/9ycOL4WE1bYfNJOnq1NocCr+D0VOsLvLQygg3Log4vSbyctltr0b0k7ECVtnlWgh6ia2UT0vzQ9JvGUjAmZL5QQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749715171; c=relaxed/simple;
	bh=cg95QS7ahrj3eChZq7kcnm48V0cziGX0GU4b+TZ4Tlo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=dBK30XtGPe34mvfdKRNnbCx6d+3hDomc1+qVpzoFLle1UBl1WYAI7WfiZlScEL1N7w0LS4pPbX5ixBprSOdBMqDzgrdX8n1DqPWFLuZM3JHXvgXiDrkJuy4iWdAPp45uH6lTuiJ5V8Qu1P7qbVYrZAXSrwXvS8WRns3bN5K0V2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZjnJlD3K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZjnJlD3K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 599D2C4CEEA;
	Thu, 12 Jun 2025 07:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749715171;
	bh=cg95QS7ahrj3eChZq7kcnm48V0cziGX0GU4b+TZ4Tlo=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=ZjnJlD3Klpg7Z1QABilvfKy7GNDxuNl707MOEDh/FWw5KghLuwSAk7ZOsdhiGrgB/
	 vy9k7be65seE2QrVZv7kn8qv8AutNd+kPoZWl3GcLctMQGZfvHUFa3SjOY/U37J5CP
	 KvIl46B1JE9FrJtEPDOygIo+rrPYhweUeXSOB7X545kcXv4DHPz3dm0/2ge5DvcOq4
	 082ucjfxyUiEvSb/VcZS6Qw3uRMKuYRF/OIRVp1sJzmjxQaLoAMI3OuIjN+lE2fpib
	 7+e+SnNj3rng8ks0Q23FjjAlc0xUswAXIuYZmJWpAZ6MmqCFZYbxKEr0gqwoZ2Frhp
	 ihsXDtNO2phIA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Jun 2025 09:59:26 +0200
Message-Id: <DAKE9EYUTYB9.2LIYWQ9MW68BF@kernel.org>
Subject: Re: [PATCH 2/3] rust: revocable: indicate whether `data` has been
 revoked already
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>, <gregkh@linuxfoundation.org>,
 <rafael@kernel.org>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <benno.lossin@proton.me>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>, <chrisi.schrefl@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20250603205416.49281-1-dakr@kernel.org>
 <20250603205416.49281-3-dakr@kernel.org>
In-Reply-To: <20250603205416.49281-3-dakr@kernel.org>

On Tue Jun 3, 2025 at 10:48 PM CEST, Danilo Krummrich wrote:
> Return a boolean from Revocable::revoke() and Revocable::revoke_nosync()
> to indicate whether the data has been revoked already.
>
> Return true if the data hasn't been revoked yet (i.e. this call revoked
> the data), false otherwise.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno

> ---
>  rust/kernel/revocable.rs | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
