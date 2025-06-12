Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCB0222576;
	Thu, 12 Jun 2025 08:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749716162; cv=none; b=XNMyO+1aX2f2j85GbYnYrt0qb0Pq1B316K4x5CSCTi+LqeAkB9FublO7R4ouV3hFB0ozZqciN/UEWEZWPMqd9fUxZPRwgCxgfsNzzxoXGz5t4+kkmkGpJGBib/0NiuTKhZ/dLW+dM8lqjsS3y0z7/Xo4P1P4N2g2eaqRZync8G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749716162; c=relaxed/simple;
	bh=ecR8AAQgwILfljLPHk1Tr04bOTKmgHmuYykhJqIE55M=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=Sf9nbOO1pcnfnhipc11MykBAyClQjYOVaX5/d8Jqr5dcDj6U6WNagU+FAwSy2MObjg57S22UHpWyHhJtMzxlgQf+ePkD/4SMiK7MfVzb7hlJR1KA+5MFEZZGfJYvzAqWqsjLLTa8QF0UI3lKjfzDwwec7r424v/cjphVA3Foorg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ElXkl7ay; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ElXkl7ay"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72906C4CEEA;
	Thu, 12 Jun 2025 08:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749716161;
	bh=ecR8AAQgwILfljLPHk1Tr04bOTKmgHmuYykhJqIE55M=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=ElXkl7ayFX0nyVj5sBPIdJzSQFOZ89rlsCiPEDMX+Gwb+Fggx2pUrJEGt1NJc/18W
	 upKBpAE8ly4I3Was27a0JFBuvjzXH4hMV3J6G1+YkVM1Lr2Ie2GjWiHYfJpK5CE4B0
	 ECE4Wiz2mLFBy4PXxwsHaRA4DcM6NWUya8gXCUTIzI22RGFWODFecbNtvdW26X6Ba4
	 QgHp8yEn51noYr3yKx9MzNzmcO+wEHHav63su8Yz/bPNOqjbCMI+0FPw8xinpjVvpB
	 UK46/nwhxHld7pViCCMNeTxuVvvTXLZKfRKCbWzi78gpLi3OR+S5GBPODl2p8SlBTj
	 yVp7qq66NmcTw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Jun 2025 10:15:55 +0200
Message-Id: <DAKEM192U5RZ.3D00TOR520LRY@kernel.org>
Subject: Re: [PATCH 1/3] rust: completion: implement initial abstraction
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>, <gregkh@linuxfoundation.org>,
 <rafael@kernel.org>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <benno.lossin@proton.me>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>, <chrisi.schrefl@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Ingo
 Molnar" <mingo@redhat.com>, "Peter Zijlstra" <peterz@infradead.org>, "Juri
 Lelli" <juri.lelli@redhat.com>, "Vincent Guittot"
 <vincent.guittot@linaro.org>, "Dietmar Eggemann"
 <dietmar.eggemann@arm.com>, "Steven Rostedt" <rostedt@goodmis.org>, "Ben
 Segall" <bsegall@google.com>, "Mel Gorman" <mgorman@suse.de>, "Valentin
 Schneider" <vschneid@redhat.com>
X-Mailer: aerc 0.20.1
References: <20250603205416.49281-1-dakr@kernel.org>
 <20250603205416.49281-2-dakr@kernel.org>
In-Reply-To: <20250603205416.49281-2-dakr@kernel.org>

On Tue Jun 3, 2025 at 10:48 PM CEST, Danilo Krummrich wrote:
> +    /// Signal all tasks waiting on this completion.
> +    ///
> +    /// This method wakes up all tasks waiting on this completion; after=
 this operation the
> +    /// completion is permanently done.
> +    pub fn complete_all(&self) {
> +        // SAFETY: `self.as_raw()` is a pointer to a valid `struct compl=
etion`.
> +        unsafe { bindings::complete_all(self.as_raw()) };
> +    }
> +
> +    /// Wait for completion of a task.
> +    ///
> +    /// This method waits for the completion of a task; it is not interr=
uptible and there is no
> +    /// timeout.

Another thing that we should document is weather this function returns
immediately when `complete_all` was already called in the past.

---
Cheers,
Benno

> +    pub fn wait_for_completion(&self) {
> +        // SAFETY: `self.as_raw()` is a pointer to a valid `struct compl=
etion`.
> +        unsafe { bindings::wait_for_completion(self.as_raw()) };
> +    }
> +}
> +
> +// SAFETY: `Completion` is safe to be send to any task.
> +unsafe impl Send for Completion {}
> +
> +// SAFETY: `Completion` is safe to be accessed concurrently.
> +unsafe impl Sync for Completion {}

