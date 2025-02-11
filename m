Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F03261594
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 19:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739300595; cv=none; b=QJO4aniXqrtulwqaXvH2cMb6G8xt4r0KwpnpLthO73+yOOcI9WhninQ2/Hw+P01nSs9I214hnrwglPr2TosedC2Q4KR95dUa2HDA9VfLPKqKoz3a5fCxmCfD0CkSi0nqTFpCM/dd8BA3C7z5XRzkZOUFpru+QjEKOMVVla5lF8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739300595; c=relaxed/simple;
	bh=InLr37aMSRGpQcwIYcHkaraKipAuhUz5WKTz8aS7SD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S+z3cyPderU/G1vt7CL0bXpQDUGuGsZQBQ3EJB6TPIdjnaVvXo5Qshvri3ZPOtWgOrnR9Iv9yEKiBlZt8QVn5JpWwrMag0NSQ84suH8L7TExpKDYj52lvBVrQ2a2mK0B2uWzM6wLL7+7MV8kQNx/cBwGsmqbARJ7HXbX9peLe60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ivxqh+q0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ivxqh+q0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA3DCC4CEDD;
	Tue, 11 Feb 2025 19:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739300593;
	bh=InLr37aMSRGpQcwIYcHkaraKipAuhUz5WKTz8aS7SD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ivxqh+q0B+P8c7dYnZ0cWbo8Gb+1119uXbfjnSKRklGYfcGQihTTwEYgy/rEr78Li
	 I/iF1sOXlV9vHRzDqQqnJ4UDa+uiysgPfc+TuLd/vFOKt/g6CE4ByPfvRN9oyZDZAR
	 GohmEIteMiaZondmL/inqubyKUXN/Yjcona2jONcFCDIbgWNK1VkK8RtixqQF9rAYY
	 rBjzLS0kkW4oA5ntNRLELmxrln3K3v5WjBe4P0tTpitTxS5Dg5acbMAeb/TB07khpG
	 qjmkMX5+QMhMz0ERV6q6rWPwJn15sr6V/e1EaDjoXCO3Zaci/j+G8bb1KKFTZpcTQQ
	 Dq8sCjcIdiiqQ==
Date: Tue, 11 Feb 2025 11:03:07 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 30/35] x86/bugs: Add attack vector controls for
 spectre_v2_user
Message-ID: <20250211190307.g36lotfyi6dmc3cx@jpoimboe>
References: <20250108202515.385902-1-david.kaplan@amd.com>
 <20250108202515.385902-31-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250108202515.385902-31-david.kaplan@amd.com>

On Wed, Jan 08, 2025 at 02:25:10PM -0600, David Kaplan wrote:
> @@ -1614,6 +1614,13 @@ spectre_v2_user_select_mitigation(void)
>  		spectre_v2_user_stibp = SPECTRE_V2_USER_STRICT;
>  		break;
>  	case SPECTRE_V2_USER_CMD_AUTO:
> +		if (should_mitigate_vuln(X86_BUG_SPECTRE_V2_USER)) {
> +			spectre_v2_user_ibpb = SPECTRE_V2_USER_PRCTL;
> +			spectre_v2_user_stibp = SPECTRE_V2_USER_PRCTL;
> +		} else {
> +			return;
> +		}
> +		break;

Can just fallthrough in the should_mitigate_vuln() case?

>  	case SPECTRE_V2_USER_CMD_PRCTL:
>  		spectre_v2_user_ibpb = SPECTRE_V2_USER_PRCTL;
>  		spectre_v2_user_stibp = SPECTRE_V2_USER_PRCTL;

-- 
Josh
