Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3DB1D79A5
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 14:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751380130; cv=none; b=celpo+1+nNWgEtp3cIvaBGkwrXI9U3FKi1ajn3twrk2zGAj60BbKl34g6w+n7mxmRj8/Dv8mjj70SZeGcDz9/W3UxHurMGEkaUoe7G4/JilE/wkfKrqSpeiNTTekiPO5aSY2UbM3dp2x7ZeObPs0RN4GLb3IMCiGN+24JPdmE1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751380130; c=relaxed/simple;
	bh=K427iT1HGc8zDoadE5DGLiLL2or8Wi/lmQxJ08Jt14w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OstGp2FFm+bFb4Zm4YS7MHyBMCULWozgia6c4BTBj30LSyXinjhMvLqc9skkbDxN5KL/PeMZd4BFqSfUa/KymOdoZ5Q9KUkLwyK4d+GYfK4RP9rQZ8A3KOy5Xjcg3SNjBB5r3ziXjOoPAkhKwzzqaooXjKG9efqsVfW+Yf0fVPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43D76C4CEED;
	Tue,  1 Jul 2025 14:28:49 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: pi: use 'targets' instead of extra-y in Makefile
Date: Tue,  1 Jul 2025 15:28:47 +0100
Message-Id: <175138012160.1964245.3629792221898551115.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250602180937.528459-1-masahiroy@kernel.org>
References: <20250602180937.528459-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 03 Jun 2025 03:09:35 +0900, Masahiro Yamada wrote:
> %.pi.o files are built as prerequisites of other objects.
> There is no need to use extra-y, which is planned for deprecation.
> 
> 

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: pi: use 'targets' instead of extra-y in Makefile
      https://git.kernel.org/arm64/c/6853acd39998

-- 
Catalin

