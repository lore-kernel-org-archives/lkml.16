Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D87E235358
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 07:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743577704; cv=none; b=Sc8jK5pYZo7rinN2czy2KNd2DNYMUdxoWnt19hx/C8WCOcvHubDekXIB+FK+TBXumnPV+w/0ft6JCvnMZAlsyfjNYww1BHU2PvIjTF8NIHZDIIRUpKsAI2VxM9WfbampcuPSfghN9pXQoVmCUcnqi4qgDRX6rUOiGHL7smaq9iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743577704; c=relaxed/simple;
	bh=scO2MWhzghsEBmqX3QWuvXKxtonoPDmNbW3ut34UDEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e0INWH8xQmCpvmKy1VHQvPm4Os3Ht+oKvRVur6DbSIuX2sO7KPka2BitscrApeHGpEc+lucpOdEDH4tqDiaS6suzusJXTlImZOuBoaP+eJvZBkDg0f38nKb3j1RwNv0IkZjQagTnH9ugx7rwUwx0neMlMjzGydeSqP0wG8fajvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XkFnafQv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XkFnafQv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A644C4CEDD;
	Wed,  2 Apr 2025 07:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743577703;
	bh=scO2MWhzghsEBmqX3QWuvXKxtonoPDmNbW3ut34UDEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XkFnafQvz5FqIufB2gWlj/BBL1LUVHCK//FjRAoOaXW0nC1cyh3WbafPG3dKFRi1Z
	 FXowxAevB794h2C+gmiXn58i9l+pvBDYOr3ZyMO9rh5IjK3948Yj7D/278idZb98gy
	 xCAa8RfmVgya46f1VtyGy9VqMQhotp8KCb/+O60Q=
Date: Wed, 2 Apr 2025 08:06:51 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Siddh Raman Pant <siddh.raman.pant@oracle.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] published: CVE-2025-0927: Rearrange fields in JSON.
Message-ID: <2025040225-last-kitchen-9035@gregkh>
References: <80cd3f46783cd5702b3abd40c11f3f08f64717ec.1743576485.git.siddh.raman.pant@oracle.com>
 <93257fe21a95499b59e410f3dd514d287ffc8cdb.1743576485.git.siddh.raman.pant@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <93257fe21a95499b59e410f3dd514d287ffc8cdb.1743576485.git.siddh.raman.pant@oracle.com>

On Wed, Apr 02, 2025 at 12:21:53PM +0530, Siddh Raman Pant wrote:
> Now that we manually fixed the values, let's rearrange the fields so
> that it looks like other CVE JSONs.
> 
> The order doesn't matter, but it's nice to have it look the same way.

Again, this was created by vulnogram so let's leave it as-is unless
there's a good reason to change it at this time.

thanks,

greg k-h
