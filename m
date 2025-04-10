Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2C91EFF9F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 18:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744308880; cv=none; b=fDr57+b1rOru/SZUEZchHo2ZqQE8AiA9eemCBmFm5eD9E+wyT/kzflOLGG2wdn2vDLsuWWgsH0ubWKYrDthJ9zMnFoTkHGDDR+cuPTeRIZvupWf/OQRJbl1oJ4h4iKFOj6nUbjb7bQTbXc8ciM1VGqreB49uaALSy3cKJFsXrlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744308880; c=relaxed/simple;
	bh=VWX8nIUUxN/PJaDyhkXcvkoxpd4L3vJdwDD6owJjZlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u4ffoyMhMorjhQ65/PDOvSI+Y/JLkKTiPLZWGPBhsp8R6zzoBHvwk4iHaBtjXd96OPBdon8RO1XmN9rAyT08U4V95SLw2F/mnCyINaEA8g+tG3I02d+EMlBVvZP0Huqsk5QauPHTa+yQ0uPdPKWH9EFIGpWFLghqyImNTXwZzRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IqCAVXkf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IqCAVXkf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8067C4CEE3;
	Thu, 10 Apr 2025 18:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744308880;
	bh=VWX8nIUUxN/PJaDyhkXcvkoxpd4L3vJdwDD6owJjZlk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IqCAVXkfex0D97iDhxIa20/CKQ7LmmVdnqhHshPRQ8s/XtLMKs8tscnS0mT+jFUu7
	 853VYpVdpkud8MS1fKndDSh2OqwXgVpYzn+OXKgYaDNzrnRX6LPs7WgXH8NHBMCus+
	 92d7RxalsT6ECS+7uazU1f9gNWhQxY88eEyyeSxF5XcJG62DUKhARkyINM/x3vLvKe
	 LKXPnq71lQTMzX8OG28MnD4I/Mh6IRXp5sQQnq191NN15HidgYJ3LTVpMU8exJwS3g
	 idueTd/h87bMo+i9iK+93/yUicfzTWdWBt6Op0jDrQUD4av9TbMR7lP9xZ+H+Rz8wG
	 ni8XIYR78H0AA==
Date: Thu, 10 Apr 2025 11:14:38 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Peter Zijlstra <peterz@infradead.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, 
	Brendan Jackman <jackmanb@google.com>, Derek Manwaring <derekmn@amazon.com>
Subject: Re: [PATCH v4 17/36] Documentation/x86: Document the new attack
 vector controls
Message-ID: <fkl2b3ymatulazt2xjegubqcejx5bgaraktztpkitodrbbsozw@xrskej3fg3jf>
References: <20250310164023.779191-1-david.kaplan@amd.com>
 <20250310164023.779191-18-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250310164023.779191-18-david.kaplan@amd.com>

On Mon, Mar 10, 2025 at 11:40:04AM -0500, David Kaplan wrote:
> +=============== ============== ============ ============= ============== ============
> +Vulnerability   User-to-Kernel User-to-User Guest-to-Host Guest-to-Guest Cross-Thread
> +=============== ============== ============ ============= ============== ============
> +BHI                   X                           X
> +GDS                   X              X            X              X        (Note 1)
> +L1TF                  X                           X                       (Note 2)
> +MDS                   X              X            X              X        (Note 2)
> +MMIO                  X              X            X              X        (Note 2)
> +Meltdown              X
> +Retbleed              X                           X                       (Note 3)
> +RFDS                  X              X            X              X
> +Spectre_v1            X
> +Spectre_v2            X                           X
> +Spectre_v2_user                      X                           X        (Note 1)
> +SRBDS                 X              X            X              X
> +SRSO                  X                           X
> +SSB (Note 4)

Any reason not to put the "Note 4" in the same column as the others?

-- 
Josh
