Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55881255F50;
	Fri,  2 May 2025 14:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746195206; cv=none; b=kop5CkkYlgKooUVBjt8asIcFsLWdUGI/FxnM6DpryfsSzLLX3YtGvdiTsBGAUu1FUSX+h6BxNoCkVO+Drp7e6VWxZB5W5Eu9SQtX8XolyUGLpZ06IA/+NXVkGm0yJ5SoFthA/0t+IKFfSTqRF0UosAcIOpbBHRTCnqY7R3eq0T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746195206; c=relaxed/simple;
	bh=a5GL95S52rGLOKqzJyecZG9nL5faTs1++SItGDtOadY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r272l7qz/sgI6tddgqCQf3q36l1Iv8JhbXTzmPv0136lerKSY8UZAzzDNQ1k5JqYIRWszrdQfEws1XVat0DbjI/5p0t9VjbhSo5osXxyObKfuTMPdwVymuVIUjDVj5YAysAMbvCQF4ypL3yM5bxjbtLglGIDLpk0qGZKGU6nuZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O+0bm4A1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O+0bm4A1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 172C7C4CEE4;
	Fri,  2 May 2025 14:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746195205;
	bh=a5GL95S52rGLOKqzJyecZG9nL5faTs1++SItGDtOadY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O+0bm4A1NzbFIEiUtEctmONxv1XSSfv8lG6liNbV9pmj+466+Pz6L1+nykmSEi7EG
	 z7hBqDEM7z00AV61wCuSP0o/UCro3YGKNM3+gn4VqSCWbdZvrvryxkEwP4Xc1Hg1Md
	 5nelkGDuJ2FlVgq3/d8URtkCm0q1V+8sN4EqpZIEUlroyL+NMwBwE8jsB/jWVl8m8A
	 uhsK2DS9QUAuCVsKGLKvyLL+hq8W45c4fWrILeEruY9HXswylj8noKfUfQozXuKqPg
	 hneciSw+kI23u+ppgsjdor1o/pkGcMaJfvZqEP6GUmdKl5qCDBVQN1GMhHEodHZVRv
	 rcYl+gYo+4KDA==
From: Miguel Ojeda <ojeda@kernel.org>
To: dakr@kernel.org
Cc: David Gow <davidgow@google.com>,
	aliceryhl@google.com,
	linux-kernel@vger.kernel.org,
	mmaurer@google.com,
	rust-for-linux@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>
Subject: Re: Re: [PATCH v4 5/7] rust: alloc: add Vec::retain
Date: Fri,  2 May 2025 16:13:14 +0200
Message-ID: <20250502141314.1661057-1-ojeda@kernel.org>
In-Reply-To: <aBJPHUDYBGyAgUNf@pollux>
References: <aBJPHUDYBGyAgUNf@pollux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 30 Apr 2025 18:26:05 +0200 Danilo Krummrich <dakr@kernel.org> wrote:
>
> Can we have this return a Result, like doctests can do?
>
> Don't we have macros around kunit_assert!() and kunit_assert_eq() outside of
> doctests (i.e. dedicated kunit tests)?

The initial KUnit `#[test]` support that landed was very basic:

    https://lore.kernel.org/rust-for-linux/20250330170535.546869-1-ojeda@kernel.org/

The missing `assert*!`s support is definitely annoying. I took a quick look,
and it is not too bad to add the support. The `Result` is then easy on top too.

So I will send the support for both already since I suspect others will hit this
quite soon.

I hope that helps.

Cheers,
Miguel
