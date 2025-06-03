Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC15A3FB1B;
	Tue,  3 Jun 2025 00:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748910079; cv=none; b=dmVoYlRSpPGuU0sOb+V2/yxVoRrpyk3LvTjEng7v22WPf+WljJenOBnv7b0Tgo6ER1qAquiaPaW+1Bv4f6hYUQAaRzr4kaMEDp2LVNM2DPKHx51AAKZU4j6JA9Y0W8mOCjevYJXFDCB2pHbw3xbc2fJOOf2JmofSYO1FTwgrVRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748910079; c=relaxed/simple;
	bh=MWrj5atno0cuT5s2HFsEZ2k52qUiqdtXZGbwrqLLBuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pg6X+PIGVin3onxz69xb0rMhAJHB0RrCdZaAv4ojCWM70V9H/Tj+dtOsX+jD1wMYPfpsMbcxYz2iplhQINA3pmGrQ3cjvZIrnmk1x+mPgjn48WmNsLE/RfvtcvOu4sH3qvbsYckB8opvC6WyROvDMhRV51nQh6x9zVVaEdp//fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ne7wRHd3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ne7wRHd3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7937DC4CEEB;
	Tue,  3 Jun 2025 00:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748910078;
	bh=MWrj5atno0cuT5s2HFsEZ2k52qUiqdtXZGbwrqLLBuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ne7wRHd3d1cejKlhch3gghf+DNzbBWeACRCqN4Zb0WzX5q7b2qXvLrVy6BP5TlJVi
	 mr+hGVLprT4PPC5feBW/MCuH77gxK/N8rZ0kDtu3gHzKvssCyHMOPkKkjNKcTJuhJM
	 H4X9eV3ZAlM/qwN4L863/aBXHQ3W4nDbtdsu4CxgBsoXK0a5g/QSxzmazO1Vb5g3UP
	 Xq7Cf/azha8EhJetSQ8OvHcF8RZ2n9rr5EGtn/fxoQc7qUVCUd3KiBKDJksoxYyuCJ
	 RPi17e5cpd/+DFJdgF9X3KSjGZjCFfw0HkS2s+HdeOn8xdHxd+uAOdJrSD28tEjGnm
	 wSVHVooFEsZpg==
Date: Mon, 2 Jun 2025 17:21:15 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Klaus Kusche <klaus.kusche@computerix.info>
Cc: Nathan Chancellor <nathan@kernel.org>, peterz@infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: 6.15.0: objtool "unexpected end of section" errors with clang
 20.1.5, and lto
Message-ID: <n6aiswq3lcydlja74mcxjim3vo7ufhxvuv5zpi3cdxcvg4ucaq@mje4ygn2wksc>
References: <d3876ed6-669f-4647-a742-0aae59989e0f@computerix.info>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d3876ed6-669f-4647-a742-0aae59989e0f@computerix.info>

On Mon, Jun 02, 2025 at 02:18:52PM +0200, Klaus Kusche wrote:
> 
> Sorry, resending my message dated 2025-05-29, no idea why 
> that message was appended to a 5 month old dead thread
> instead of starting a new thread...
> 
> 
> Hello,
> 
> Compiling 6.15.0 with clang 20.1.5 and full lto, 
> I got several error messages "unexpected end of section".
> 
> See https://bugzilla.kernel.org/show_bug.cgi?id=220174
> 
> (kernel .config attached to bugzilla bug)

Hi Klaus,

Thanks for the report.  These warnings have been fixed with the
following commit in the linux-next tree:

  d01ca8708d95 ("drm/amd/display: Don't check for NULL divisor in fixpt code")

-- 
Josh
