Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4838470830
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 16:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744303273; cv=none; b=AOoGOiUAP+0hGe2n3GBkLiNMN410GAzDOnNF1+AmniZ8Rx69FhtgIUUSYRlE/Z+2WHD9Tb6VyC6jvpr5/21BWHMqbXF5v9va3K+LVr5pZsoJTeFicunxL2vmSFxB2C69lnF/eEL+ZiCtfXRwBPLK7bglVA/yMi3vUjNcyPzWcT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744303273; c=relaxed/simple;
	bh=avAD11kU002qfu03T374iDco6uZspUkPTsJ2RWZhjp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rMtsleEMTv0lUUnB5IM6GjpeJ9OYNFY6k7YI4ZYksUHAUDd5b8UvYnXiypeAvN5nhVTjaNXTIjLOYaT4tkIWtiytn+Ad4uc+dLf1KnAzRCTjE0cG5SZRzlEXPfwQA4scUD/d3zTuA1ZOZD2X8rFRGk/q/FO1ysvsyPjYEMrz+ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ugv9ZZk+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ugv9ZZk+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98DBAC4CEDD;
	Thu, 10 Apr 2025 16:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744303272;
	bh=avAD11kU002qfu03T374iDco6uZspUkPTsJ2RWZhjp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ugv9ZZk+lVx1pcPlFk7HCFuIyjOHLnzayoHsCw0/1vT5+kp8QaWD7qUlJjDm5Qcua
	 pfhMjMV7IiXOdMhbx+yV0fh3oVeBdht4oi0Y7iubazJVbrbzluGpk8RuhJ3lhluMUu
	 rqa83UC7Q5mgsxEUFrly1+rsU6hAxeT+mgQyj92evH9ICjnpkJvIeMqeRo8wWKlao8
	 z03ZjbJ5daBWnBKO4PZ+gJIvlZ5B5ErGvHKg8bbVIyUaZxn6dvNc6Du84pAYb1jLbL
	 gl8ERIJ/14k/YapvHBN8WtPzBj7UKa8z545g0ZiMsuhhEZYyGziMHxuWJUqD+6Z/Sh
	 xF+5PoOVPt/pA==
Date: Thu, 10 Apr 2025 09:41:09 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Peter Zijlstra <peterz@infradead.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, 
	Brendan Jackman <jackmanb@google.com>, Derek Manwaring <derekmn@amazon.com>
Subject: Re: [PATCH v4 11/36] x86/bugs: Restructure spectre_v2_user mitigation
Message-ID: <pruotxsn2qn5gdxzeiowx4wy75xtlbiarpqyqjt5timl3sui5h@uiareopp3xny>
References: <20250310164023.779191-1-david.kaplan@amd.com>
 <20250310164023.779191-12-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250310164023.779191-12-david.kaplan@amd.com>

On Mon, Mar 10, 2025 at 11:39:58AM -0500, David Kaplan wrote:
> @@ -214,6 +211,8 @@ void __init cpu_select_mitigations(void)
>  	 * choices.
>  	 */
>  	retbleed_update_mitigation();
> +	/* spectre_v2_user_update_mitigation() depends on retbleed_mitigation */
> +	spectre_v2_user_update_mitigation();

Function names need trailing parentheses: "retbleed_mitigation()"

-- 
Josh
