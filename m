Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9281A00D1;
	Thu, 27 Mar 2025 16:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743093668; cv=none; b=IOVj9mE2oLyQB0OZ5UXFILuLwtmZQFFxw/A7GXtlIJAXCb9WAMWa+oZ1CI5d81a/EngvtgAgQHpVsIK+g+gI1mB1I6ptcejcFBb4r8oV5ZMLD5wVAXfU0iW1tZpurQTlhKBcIkk+oUIB0dhTdRTFBdb6ta559uZ9XMYzAT8picA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743093668; c=relaxed/simple;
	bh=f+qtwl3UQE1TexghPgxTSWj87ZJ3sAnv422eko/TQcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kGWg8vGZzO+8PHyVOF7tkhBEECbB+4bwai5y9eeKSgbunaS1rZvLUGeQDL42q4vvE2+MGpQMvd45fCmxuhtu0cxVSuYkAXjRxTfLmtGVQTCUR4HwVBjYPdmjhBpO7I7qi1IP87KX7hYlOXqVmL+eewT7R1CShr1fjeVfYMaIkWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NKtv7Gni; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NKtv7Gni"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1214C4CEDD;
	Thu, 27 Mar 2025 16:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743093667;
	bh=f+qtwl3UQE1TexghPgxTSWj87ZJ3sAnv422eko/TQcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NKtv7GniKPdzWtcfkk/ebCw4lt/02NVKmw79SymGNcHew9ZzwcizWlMOKmirOargR
	 e8Bq3dDcJpkK1LLQkHGW8T9b5Wgnkb74xSCmi7s17Ua7O4QPgIx5g6BY+dQyO2ecuB
	 vykCFqPM6f+OELCrasNbJXmrsPgzBiMXAx7tmPbIcxbBFBFeJUh6LkahXB6FscXFmA
	 43IsZn8mxQRfo1vTDSJkeqc9sFbnQLgYc31KBr5gGBTh9LhuVeJe8wTRG6/5lkRnxy
	 lv+oDoHFiIqiZ1QPdryBPOOLF5axtw4VCZA2bWyKea11aRXNQOCxbFWs2RxXsqUYCa
	 bKWZWJvoxyTFw==
Date: Thu, 27 Mar 2025 09:41:06 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: David Binderman <dcb314@hotmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH] arm64/crc-t10dif: fix use of out-of-scope array in
 crc_t10dif_arch()
Message-ID: <20250327164106.GB1425@sol.localdomain>
References: <20250326200918.125743-1-ebiggers@kernel.org>
 <AS8PR02MB10217FDBBC9DBA3A5B3C5F27B9CA12@AS8PR02MB10217.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR02MB10217FDBBC9DBA3A5B3C5F27B9CA12@AS8PR02MB10217.eurprd02.prod.outlook.com>

On Thu, Mar 27, 2025 at 07:58:51AM +0000, David Binderman wrote:
> Hello there Eric,
> 
> >Fix a silly bug where an array was used outside of its scope.
> 
> I am surprised your C compiler doesn't find this bug.
> gcc 14.2 onwards should be able to, but clang not.
> 
> I will make an enhancement request in clang.
> 
> Regards
> 
> David Binderman
> 

Neither gcc 14.2.0 nor clang 19.1.7 found it, unfortunately.  And the code still
passed crc_kunit (even when run with have_pmull disabled so that the code is
reached).

- Eric
