Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CCE1F1528;
	Tue, 11 Feb 2025 09:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739267047; cv=none; b=t6PKt27WSZjY3byJxK8QVYFJ4s2MHhJmfELIyWBuwRuf/NIXHVJTFGZZfF2KOGE+pG3SisDvnksTE7PgEViplmcCyX0U6PlAkvlZmpMTTP9AgNZprezKe5H42PgJMUGe9rjDw83WgnL+POCiIGuhe/Awpzu+qT1BM7PK8banP40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739267047; c=relaxed/simple;
	bh=fyUuuUrOMp/QMIR+pMlbiTz0D7pIXEzTcFSFL9YSYl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bP61B4Nl/yc7fpyfFXzCr6IcX3I9wNNhuNac3PwbVany9og5/VBe18MZLLGGYpna+y7nRRL4NZ4ODFXac3SECn150ua7HXlFHRgcHV/wsMua47DZByRRrwcua3OUlvX61gxZo/TpulqIieWxIJ8XprNUpkNrRUDmeSCZeGTwtak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oAvN/DRk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oAvN/DRk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F95EC4CEDD;
	Tue, 11 Feb 2025 09:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739267046;
	bh=fyUuuUrOMp/QMIR+pMlbiTz0D7pIXEzTcFSFL9YSYl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oAvN/DRksST7aF5KRTgGoaVGB6a9uTIXf3XLaC9whNq8zRtr9LHDUUUvlsdqkJkqT
	 SxK97HOSDcddoeReDjBgiWriYMsQHwcksVn+e3GIOwLCoq4i3J7tqwo2ht++WUml3U
	 1OXmXmin/NOX2pByAtqX3N/hUDUqkFDqOg0793q5AIGW6AxZU01+9jivOM479GNeZ0
	 PTTNX44StxFCTMrLzstKV5ecyuPjwul+Zl2nKXltLOkA4nE/5bA432QY83Wn+7atVo
	 pN9NDuj5N0Hws7v+VeRc/mZ31KclqbrvQkjBoYtr3c+LHRt2M+BJzmfe2j1Ec6G0aQ
	 a/PIhmrZn63eA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1thmoP-000000007W8-2ApA;
	Tue, 11 Feb 2025 10:44:13 +0100
Date: Tue, 11 Feb 2025 10:44:13 +0100
From: Johan Hovold <johan@kernel.org>
To: Tony Chung <tony467913@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/3] drivers: usb: serial: mos7840: Add defines for clock
 select register offset
Message-ID: <Z6sb7QzdeWvcIxI4@hovoldconsulting.com>
References: <20241024100901.69883-1-tony467913@gmail.com>
 <20241024100901.69883-2-tony467913@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024100901.69883-2-tony467913@gmail.com>

On Thu, Oct 24, 2024 at 06:09:01PM +0800, Tony Chung wrote:
> This patch adds define for CLOCK_SELECT_REG1 & CLOCK_SELECT_REG2 offsets.
> These two registers can select clock source between 30M/96M/External.

I think should just add these as part of the patch that uses them. If
you have some information on how they are used, that would be useful to
have in the commit message and possibly also in a comment above the
defines.

Where did you learn about these settings?

Johan
