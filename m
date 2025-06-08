Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C7A2C3272;
	Sun,  8 Jun 2025 03:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749352697; cv=none; b=d/0+VREjPZ0/AiVQWXVtyXFnPVpn8M6H7veVhNuPkHl8oTNnNvn8QpomObs5KHQ2V+Dm+ZoYHjBd2FLoryGvjYsCbZhBy7J3JHJQpl4dFgqoQIcZMfEoeNNCZyOQ6WFL2KO+jxE6r6KaE2DZTN7xAMsuL5y5TlHnQkGsAaoEn5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749352697; c=relaxed/simple;
	bh=tpiXHqTG0D5Q3GFuYHF1RrcOAUFAb/35fjq/EBTfuF0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cjyzOPxQzpfvDrPzGj8zVSRRGoPSJtN6CB+TnLuoWv46B6xWMPy9CNpm6vgAPreEAtw+llT3N5ZAmCqzBP6+yV7fmTd3elhRJsZOrtTC6l31FyMesaimdFZIMT0mdFAjN0/jQKXu3CIcaBNjNxvBdvUAyFRxKHg29PXJmXtu3qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s389/0Ko; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s389/0Ko"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3EDEC4CEEF;
	Sun,  8 Jun 2025 03:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749352695;
	bh=tpiXHqTG0D5Q3GFuYHF1RrcOAUFAb/35fjq/EBTfuF0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=s389/0KouQmShEKLDbZkMZhliykBxKnUECYSCgnn/Dyb7AcDlaqSj1MqP9mjErQl8
	 N3EEaG86hKZLvWTanTfMlUg0Z4gfZx7H0jGJhlbBqiH8aLy9GA9kI0G2vLv28sn1Bx
	 pC7Ne9cE+j1EAGaTqI0Opl1GuMQDrP8pIZRgHLMOyw2Je7sWjgVZ5C5+iHVcg3i+3Z
	 Skx0UfBX4GyHLVuNC/I7UJVBGCDyz72VrNvdv9rZKBK1Y3uNe0PLgPES1BLYovv15l
	 la+j626whpidSXWMmqhIVPlp3JvW+95cIG+lBIpW/kq3Xo4JzRFOBU2kjNG11OO4t2
	 G5lgo9iyTbuvw==
Date: Sun, 8 Jun 2025 05:18:10 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/9] docs: kdoc: remove the
 KernelEntry::is_kernel_comment member
Message-ID: <20250608051810.3afc2d46@foz.lan>
In-Reply-To: <87y0u3d6tw.fsf@trenco.lwn.net>
References: <20250606163438.229916-1-corbet@lwn.net>
	<20250606163438.229916-6-corbet@lwn.net>
	<20250607120745.7e0fee67@foz.lan>
	<87y0u3d6tw.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sat, 07 Jun 2025 07:22:51 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > Em Fri,  6 Jun 2025 10:34:34 -0600
> > Jonathan Corbet <corbet@lwn.net> escreveu:
> >  
> >> entry::is_kernel_comment never had anything to do with the entry itself; it
> >> is a bit of local state in one branch of process_name().  It can, in fact,
> >> be removed entirely; rework the code slightly so that it is no longer
> >> needed.
> >> 
> >> No change in the rendered output.
> >> 
> >> Signed-off-by: Jonathan Corbet <corbet@lwn.net>  
> >
> > Not sure about this one. The idea of those warnings are to detect 
> > non-kerneldoc markups that typically comes when someone "imports"
> > OOT drivers or Windows one into Linux.
> >
> > I remember I catched several such cases in the past with the help
> > of those warnings.  
> 
> I haven't removed the warning, just the use of that specific variable to
> trigger it.

After looking a the patch again, it sounds OK to me.

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Regards,
Mauro
