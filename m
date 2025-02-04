Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469A2207DE0;
	Tue,  4 Feb 2025 09:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738661827; cv=none; b=frfFUpjMrQezTGYs6UWhqxf/cp0ezV5tr+u5Rjlwu/adGGZro3oXMZwWls+p8fRVSAO+W9OrrOkrdZLTsMTYKl8Ghi3VDd4KSwW66WXAZgrDXrefwKUJUB3lMCPwQO9SQl/0LfHFugt5ILLkleoqZK/EWQGZUfl2cWIeVyIMmug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738661827; c=relaxed/simple;
	bh=eyaVZHTYGbJ6ZS9OHR2glMbKAKPAhozNNeeFjrOvYsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UCagvL9CrwR7FM9SMKe/m4RD4R8LjgGP7I9Nh2851CDt6eDn7XkOwlC89wTumV74N+eLMRAQsTOTBH1X3s5higtmg4p8BqRPp976DLhB6KqXH4Wo8/6uth42pQ58CQK7F2DskHWFfnqRrYPQJhDYjBRWA+H32mg+UA5vE8Po06g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PxLdsvrQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PxLdsvrQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6AA9C4CEDF;
	Tue,  4 Feb 2025 09:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738661826;
	bh=eyaVZHTYGbJ6ZS9OHR2glMbKAKPAhozNNeeFjrOvYsg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PxLdsvrQv79XSMvRC2i1eW8ttVj6HhGKcBoaAt4pP3RakewsYMOuEGj06fI4CW0Ie
	 1gKx6h9IpgfsXao1H2LP6tOFXb52fojkr2CR6gyTII1C7YEdYn8dxkIc8EngJoOzY5
	 6GWiZGzx28wq9yeT3/m9KoYNehrnI7jJnWiBf6he10ooDaDHQyNnJBq3IQiC6J3Iox
	 Es3RBW5JW67lR3WeU2aZFJUz6xEfknFWEuZbrlahxO9lTCCPX6eRwaGazm0sD2l5b2
	 yeXL4C04PMaRQ1iMAcU4cZeoTThnSiFgQCHsXd2Hu460xeRv0jNtYupxs/5vex16EH
	 mbjNpJCnZTn2g==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tfFMl-0000000084B-24Kr;
	Tue, 04 Feb 2025 10:37:11 +0100
Date: Tue, 4 Feb 2025 10:37:11 +0100
From: Johan Hovold <johan@kernel.org>
To: "Chester A. Unal" <chester.a.unal@arinc9.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	dwayne Du Preez <dwayne.dupreez@xpedite-tech.com>,
	Alexander Scholten <alexander.scholten@xpedite-tech.com>,
	Zenon van Deventer <zenon@xpedite-tech.com>
Subject: Re: [PATCH v2] USB: serial: option: add MeiG Smart SLM828
Message-ID: <Z6Hfx4KBeVHCNQVS@hovoldconsulting.com>
References: <20250124-for-johan-meig-slm828-v2-1-6b4cd3f6344f@arinc9.com>
 <6e2c4db7-1325-473b-9999-2b1ada418119@arinc9.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e2c4db7-1325-473b-9999-2b1ada418119@arinc9.com>

On Tue, Feb 04, 2025 at 09:15:02AM +0000, Chester A. Unal wrote:

> A reminder for this patch to be applied.

You submitted the patch during the merge window which ended two days
ago. It's still in my queue, don't worry.

Johan
