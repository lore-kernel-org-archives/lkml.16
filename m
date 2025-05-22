Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AE749625
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 14:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747924489; cv=none; b=GuQQERNcCIu2ofH+DyioQR20TErF0Jd8C3RdS/O4KKtGw9qZg8lHPj8xJ5prGcqTSFQtO4rGTn+TIASPNKYJ/mdSAm78kHxaEPqvLm43Winz4hhu73QzMUsxi5lFtrX6Kqb0wzagVOUEe0dkwlIXMNM5tJiIkEkck7Syvir6ATo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747924489; c=relaxed/simple;
	bh=RMasDVOiSa0dzk4n96wLEuqXYoUKAgEUX92oLUcvssE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=U0mPnptkdx+iQKO2PtgyCtmPndLpy6Xp6ovqOYLlap3HFmFfbjJj4F+30T2sxx4mtwJ/MhhLHNlJmZf1jSJyQNA/I0IyhHIQvkTKjTi0/G2Rw+u3O7hXHyfrap9cHGqF4Yzs+dFOEGdcrtVNj9o5GRJcT6RLSmXwcjE7KPc0aUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r+W+OWSI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r+W+OWSI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCC00C4CEE4;
	Thu, 22 May 2025 14:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747924488;
	bh=RMasDVOiSa0dzk4n96wLEuqXYoUKAgEUX92oLUcvssE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=r+W+OWSIT1qpkf8nEZTyhtiI/V3vzPiAMvF2ETl0eVjr6x//rrgY5KhwwWFSL0XWK
	 QF6557r1potRF4/qHJOvAY0AaNCCGohAg6c392i7I+VB1XakVk9vMvh4FHjBjpQT5P
	 6J6yeiBHtMolS7kPNDlTlAoGWnEbfTIhWpQzj66iKq0oTFiyF7Y93e/IBKpWAN4WkH
	 er0uobvvyjmNhUkyrIQrEdSNJxwJyWPCc/XUSrV1RT0xfAx4EJpT+QdrDuY7N4qSPE
	 mETGDzjFy9H/jqTkTgz4RtOZuTnmUtQ3aOi/ouktt+Aw3amiCtQ38nxQ3mtYt5C7q+
	 u85PPzN6TKFHg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, Sumanth Gavini <sumanth.gavini@yahoo.com>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20250520020808.159586-1-sumanth.gavini@yahoo.com>
References: <20250520020808.159586-1-sumanth.gavini.ref@yahoo.com>
 <20250520020808.159586-1-sumanth.gavini@yahoo.com>
Subject: Re: (subset) [PATCH] mfd: maxim: Correct Samsung "Electronics"
 spelling in headers
Message-Id: <174792448762.1382298.17329304857950785447.b4-ty@kernel.org>
Date: Thu, 22 May 2025 15:34:47 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-b75d9

On Mon, 19 May 2025 19:08:05 -0700, Sumanth Gavini wrote:
> Fix the misspelling of 'Electronics' in MFD driver headers.
> 
> 

Applied, thanks!

[1/1] mfd: maxim: Correct Samsung "Electronics" spelling in headers
      commit: 01a09c2378753ba24f75fa12b7c8eac7f0f0b030

--
Lee Jones [李琼斯]

