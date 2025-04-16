Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D0841C63;
	Wed, 16 Apr 2025 15:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744817285; cv=none; b=tVHrh/uwZ3jSXiwjhPfILNWQaf9CGFNX+N7MjWdKJ8YuVqOPnPpoGcu2yHKefCLdahP0bQlera0kNdII4LrPuXJ9FYjw80RmcqD7Xow/lGHiRIMhghjfWsytTq5OVc9cbziks2p3Oz7lkoC5mKPVVAjJkV9T11dxJf8dbyPztRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744817285; c=relaxed/simple;
	bh=08/rSUx85jNyAjBSVH6oe7FLff9UzduAJaOkYerng8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uPBfen/xJ9vR9u3WcP+s2U1ENacoM3Fhqbc5xRb+nAil8tQ8Xq0mtPVqgj2enEQs84xoOz5ZGteK5zbgW83bKWK4ZjnLfSLxYEEwxZHzOAst57co5L++pQ8+tV3n7Kmpr7i+rxvu8NBZ/X5ehI2uUnRhq5q4gRhVvnWDq/B5K/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WZzegCoz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WZzegCoz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E6FCC4CEE4;
	Wed, 16 Apr 2025 15:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744817284;
	bh=08/rSUx85jNyAjBSVH6oe7FLff9UzduAJaOkYerng8Y=;
	h=Date:From:To:Cc:Subject:From;
	b=WZzegCozxdcwOT83N48BKbUeAg0fK29tmFGbKcVvS73gQnbB4IS3Bx5Agl4Ac/AOR
	 aRiR1C/U4YVfC5DsYiU2C1XIFogdOua2hM3A7UlfdaTLtODFj4GVgyAMuwoVhVsVXO
	 /qrYxm2MhdgTr/+TQAIBOYjvEq9cgH6Bsz3xmYERlQD1gQOxhxKKYNqmI2XueKmyx0
	 Pl9SXT523lM+K9sDT752m+vKZMTJGwxyOKw/8pnibEUJ4mgE8/lnNrXOFhmDWQPNl0
	 YAOKhkPqlT+JBqtveKk5HCFcJvqjCa0sAS24V/pKTpqYXrchLe+JH4n3J7rjilOCt9
	 A3rpWbCqclbMw==
Date: Wed, 16 Apr 2025 08:28:00 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org
Subject: Prebuilt LLVM 20.1.3 uploaded
Message-ID: <20250416152800.GA570023@ax162>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded LLVM 20.1.3 to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

If there are any issues found, please let us know via email or
https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
opportunity to get them fixed in main and backported before the 20.x
series is no longer supported.

Cheers,
Nathan
