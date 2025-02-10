Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F5C256C99
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739208919; cv=none; b=C22+huFMRyxPVfLJW55cJJ0ZIESAnKNCN3o/bE+kTqHKeuIhB7mnlP47IcM+ZZmTTcBrhPtLQNCAEPAMamt4zroq85EG2xtdTq16D1oRFZzWHESYq6PODiSqD1+RGnf0ZsAueK2WfGtJl919Qw7xbBUBfjFdEkPit/REynZ3Ubk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739208919; c=relaxed/simple;
	bh=tiwgmuEOBTLnzLhAw83WSYqm3hoiV2j/vuNY+JTkK4c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ci8/krmI0aCoRNoB74JodaEOTptdzXnsON9YZ2oYPAaCd1lnLgwhreh4ca1/DGPEJUWkElbY5q5ddDfQ3mGq020b7Zkqa5u9SRXaqYQvT5HYNYWXky0lo5AZBmih2TFo8Ytn9rolZDD7f8NynFEep45zSodHMWeontnZgl8W1Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ny4MTV/p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ny4MTV/p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FBF5C4CED1;
	Mon, 10 Feb 2025 17:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739208919;
	bh=tiwgmuEOBTLnzLhAw83WSYqm3hoiV2j/vuNY+JTkK4c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ny4MTV/prCT5kFV17Z/0OyPEhKvEL/y6TFeIr9PrNiAehglj6RobGA8s8eIFZ1gLh
	 twdBUReeyGJVDFZuAEGKctVadb7yycPL6H097qeauWbFUMoYmBtJrMZmBJRw3IkwoF
	 NXaDFRLLOsOns2zUUTP3zOMYlHB6K/UVO8z6RzF36iO0rAEBfWT6CBVjXbs5JalmtW
	 nSWrJhPV/E7NTyfXRZbmH0HkyoGBEqUaNGqUmOQ/eF6S33DV3faw6k2BmCLuh/Wx2D
	 0r37hQKvKRgc6N856OrngG6weKAyWk9XGbk2j1EMhUGLc95X49nVZjNl+vB5kUuVHe
	 MlqZnPLtXriJg==
From: Lee Jones <lee@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andy Shevchenko <andy@kernel.org>, Lee Jones <lee@kernel.org>
In-Reply-To: <20250129152823.1802273-1-andriy.shevchenko@linux.intel.com>
References: <20250129152823.1802273-1-andriy.shevchenko@linux.intel.com>
Subject: Re: (subset) [PATCH v1 1/1] mfd: intel_soc_pmic_chtdc_ti: Drop
 unneeded assignment for cache_type
Message-Id: <173920891813.1935666.9884718105009512198.b4-ty@kernel.org>
Date: Mon, 10 Feb 2025 17:35:18 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Wed, 29 Jan 2025 17:28:22 +0200, Andy Shevchenko wrote:
> REGCACHE_NONE is the default type of the cache when not provided.
> Drop unneeded explicit assignment to it.
> 
> Note, it's defined to 0, and if ever be redefined, it will break
> literally a lot of the drivers, so it very unlikely to happen.
> 
> 
> [...]

Applied, thanks!

[1/1] mfd: intel_soc_pmic_chtdc_ti: Drop unneeded assignment for cache_type
      commit: db8d38dab1c313a4fb870d143bebe57166af84ab

--
Lee Jones [李琼斯]

