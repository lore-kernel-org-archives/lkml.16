Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EF64317D;
	Wed, 21 May 2025 05:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747805443; cv=none; b=B/e+/ojBaGHQd4sFzYQQSEAC1NNCRGauvg2nJUC+ORGSXJJ3TYk2qf/aySoA1ut5gFzgF8qV+Iv9kNMzyWXXQc81RyL2L1v8CH4WTRHpegmfBM/giVvys7cjl5pggLF+f1DshliW/FtVS44KZAEXv3aLy17XsP+A4CxssKEQIBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747805443; c=relaxed/simple;
	bh=xxzoGcyYX27jqtcoky1rcuhuide78j57u85KKUybaIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rHTgVStfIGjSq6ynQH03IjUZs1sURoeFpXd9l7OZf0c2mrPWNIZok9hai6tGDDQM+IwZIrh7RjFhf6oXBg9xN0vdU2SJCADoxZkvgh19ZyvLEDPdhl+19fpqBDUWepsq7qgbueC7fgzVkUTTCD54V1DqO0SJJCZM0oEqxrwHCeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=F8OJvwhj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="F8OJvwhj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 000BAC4CEE7;
	Wed, 21 May 2025 05:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747805442;
	bh=xxzoGcyYX27jqtcoky1rcuhuide78j57u85KKUybaIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F8OJvwhjKjk8UQePqdjsxhwv2A+sgfggmp0+qQ42TuPpIlivYNlco3w6KJarEQGK+
	 KWGtEdzUTbCu8SWn3q6i/F54PyT5ZJKp4JG01hVvg7uAH1mkMlUBE4vnqHRZW9LJdf
	 TOLhMVWVDaY48vVwghZSGqnFbgC1cjefT+lsBf1E=
Date: Wed, 21 May 2025 07:30:39 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: rujra <braker.noob.kernel@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] staging : greybus : Documentation : firmware :
 Replace deprecated strncpy() with strscpy()
Message-ID: <2025052116-diaphragm-payback-a3ef@gregkh>
References: <CAG+54DZYz-4hW33Py9mihHDauWw55=_rP71s1MbCg-5gxw7J7Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG+54DZYz-4hW33Py9mihHDauWw55=_rP71s1MbCg-5gxw7J7Q@mail.gmail.com>

On Wed, May 21, 2025 at 10:26:52AM +0530, rujra wrote:
> To ensure that the firmware tag is properly null-terminated. When
> copying firmware tag strings to prevent buffer overflows and ensure
> data integrity.
> 
> 
> changes has been made in 3 positions:
> 1: update firmware tag
> 2: backend update firmware tag
> 3: backend update firmware tag with unipro
> 
> Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>

Your From: line does not match this :(

Also, why is this a "RESEND"?

thanks,

greg k-h
