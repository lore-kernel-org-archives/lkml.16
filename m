Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96607202C5D;
	Tue, 17 Jun 2025 11:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750160581; cv=none; b=nYyVnUVXWnkY2e1QVcje0TJT+RD/AraXKWFOkMANxkgxTbd94Hx6Bw+1GfeS4Gh/VnD05yTeSF/PnZknNkrq2B36zjcmHWIzmf8tyVgNPF0Ms95+IIbW/hkE2BrOUuWHrBnPVVrTQX2/dmnFAW/XQjAGLooUgTYw9Z1RE/lqY1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750160581; c=relaxed/simple;
	bh=xqUuWIVuwC0BS00BczMNM9ByQPSerfxrpZ78WhjB2zE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HQSaZeKQ8zyFhAXdqjIPhnCOv/eAH871e8C9tTy4+k31y1QAWCXu049yC6091IB7a9VS0CAsFpMgX8UquHeCT9WjznLcV3WCy/X1VeUKSbtkU4of5kQGq+n7XmbcRvGVrhg3iucHW6kJFMGyU/2BXm/LJ1qAAN1EekIqZYciv5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bBZgCbP/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bBZgCbP/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27FFBC4CEE3;
	Tue, 17 Jun 2025 11:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750160581;
	bh=xqUuWIVuwC0BS00BczMNM9ByQPSerfxrpZ78WhjB2zE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bBZgCbP/DD/DT0h5psMuU+QtdBU/W5hoITbF0kBMqarLmU914kcAqZRGrRTAQ/APv
	 mcskt7+V+qMVy9HFNkpMdlUeAqO0mKdsjnb30TjZDhmDIYMg3pF4L2wpIWP5OFk/t2
	 dben9XT5qkgqhqi2pQcCcSVcFato1cKjmiM9HIviLYEYpqhIYTwHUqAc5poO3hiHBS
	 C9N06FsoAVS/o8bNVUneLa7V+HjUsDWrhgqNZpQKIE1aVidFjyVGaGxTq+kDTACPSG
	 QgZ8EPexR0unyBkazXaWTW/RJCEONY0MELNR87ef7bBVjvx02mRkqzOM8Vh/PisUxy
	 XGEdx5z6rRYgw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Lyude Paul" <lyude@redhat.com>
Cc: <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  "Boqun Feng" <boqun.feng@gmail.com>,  "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>,  "Frederic Weisbecker" <frederic@kernel.org>,
  "Thomas Gleixner" <tglx@linutronix.de>,  "Anna-Maria Behnsen"
 <anna-maria@linutronix.de>,  "John Stultz" <jstultz@google.com>,  "Stephen
 Boyd" <sboyd@kernel.org>,  "Miguel Ojeda" <ojeda@kernel.org>,  "Alex
 Gaynor" <alex.gaynor@gmail.com>,  "Gary Guo" <gary@garyguo.net>,
  =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron <bjorn3_gh@protonmail.com>,  "Benno Lossin" <lossin@kernel.org>,
  "Alice Ryhl" <aliceryhl@google.com>,  "Trevor Gross" <tmgross@umich.edu>,
  "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 2/7] rust: hrtimer: Add HrTimerInstant
In-Reply-To: <20250613232754.451450-3-lyude@redhat.com> (Lyude Paul's message
	of "Fri, 13 Jun 2025 19:22:23 -0400")
References: <20250613232754.451450-1-lyude@redhat.com>
	<A3hwg_ioJkxS3BvtlkydYvNtQ2Vn5dJdafj3iRnyKQyhxTvDhvBlK8xhMiP0Ynigusbqp_Fh-aEBN-_kMs-DDQ==@protonmail.internalid>
	<20250613232754.451450-3-lyude@redhat.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 17 Jun 2025 13:35:49 +0200
Message-ID: <878qlqa9d6.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Lyude Paul" <lyude@redhat.com> writes:

> Since we want to add HrTimer methods that can accept Instants, we will want
> to make sure that for each method we are using the correct Clocksource for
> the given HrTimer. This would get a bit overly-verbose, so add a simple
> HrTimerInstant type-alias to handle this for us.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg



