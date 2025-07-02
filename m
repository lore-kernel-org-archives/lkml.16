Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4172BD597
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 14:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751465529; cv=none; b=td6EYVdRODZnrRBsQVLDlTqikUExYqHJhHMU0z5r8U3FaGn0mtsYMOLsTWUxavNFIGvMO9pyCvZ8X9ZufRDNpQEFL+0AfC8jFy/sgmt2AakIL8XN7KFs4fPjIrLzxmtNqRH0Xd5w/uLJlqY+pH70fvAo0+cgFcriFew7mWGMCuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751465529; c=relaxed/simple;
	bh=JRJPH4m3gHOL8iOAGjaKdf0GbC0HHnVxh4Krznoo3KI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RBD/C1SFejNDBrpLOLkCFrxuRSpxoiJcl+VMrfJZqc70FuHMtPPzhDvaeOrOdc9FPrWulQGAG1yeOGGt5pkA3mj2BOlHkG1pzhZ3nC3XIQyoMoID9VRQAVfiuoe/y99ZQJ1RaFzIv7EMK5ogJxkQsipQSQiL4b3sbK83C1a0GHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JzVfcQmI; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JzVfcQmI"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e812c817de0so3818693276.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 07:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751465526; x=1752070326; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1mPoU1UCDxjl6IWc+jKm50U28f8v3ln7LdhgS9xFHd8=;
        b=JzVfcQmIhRCBHkY7YMzvyyFHMH69W22USFiAIMlmWmJViWurdbP3UXDxOUX/ZB56DH
         hriNNwFVMwhrsnyiXPsNHLdpwjXlAG2x+RN9Q44qwoBOFBbdXt1KEqsvlGpS550s0Xk9
         wCrC1VKfTa4IMjvM3dLfwA/PYLwedmkAUXB+xPSJBbLsBAfjM9n+qNtzysq6H1G/qPix
         +OruNqP2iKwIQPLiWDoDjNFmDj7wxRhmOqn/8b4FqR27y7826azVnBmT4XnY/JcXfYrM
         sN08NyOhntVoojALkTFFZERbXodeU2OqZN9wWLhfwJOHfzn43EZRRv+nTDnxxxKdzA+N
         tNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751465526; x=1752070326;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1mPoU1UCDxjl6IWc+jKm50U28f8v3ln7LdhgS9xFHd8=;
        b=PXdgJRdlc5y94g3KG04bzFLxkM5T9iO2G7vZZ3wOeWhzX6GF5wfmVa5z0VtKGhWbmB
         w3rDZNv2kHY2gZx3qa0z1O8jpehQu73LlT+3iwr+0SiG97J7SdpkfuTxUFoXa9KcP7y7
         2TERIJhPcBiGz6+2+iAAr3eo6sm6eHLwmYzfwRBdzKjXGKt7rgRpurs1UnaqqYXZGkng
         zM5TLhyke3YwuzNDlmHLJ8LJHWFz6j6AxptG5QLpVTw7fqtDQvseBkghPa2xlfGyTIRM
         s6KoLnqKKqY38C2GJEqHHqQIhC4qWtdjg2KhPCc99wKw1NCImD51J6y7oJvFC7zTA109
         Tiyg==
X-Forwarded-Encrypted: i=1; AJvYcCU2+ICzRzqVDTyxM+ARouOd4GGLtGBrePoc134Ox4KDHCFnClPkpjhWoKd2cZ5CVcv9crdte3WQ5Ziw7B4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3GC1LQxhZXdRBnDFBFC9hIpSQtASC015+bFogrg+TckRKREos
	h0pPOgAMf3458n1cqb7yHcJtgpR9aXzkwE6Ws2yuPAO0v/A2i87mg+Wo4a/E95L/4bYixdPk+F0
	0n2wxUwCJeCrIMMM68z++/jjqzGFC4vnk741T5KFyWg==
X-Gm-Gg: ASbGncv9AJxuCjLN9sAMSdZ1jqh0r15lVPrf4LuqpGPih8qpON6zP9pcWfgRdwg0r86
	yJZQJ/i4aQ95ljzNiBtMLWvzeQH7rz92Zd3Y0WjOXVKJqQGJWRs93ZZk4H53xO4eGs73wopzH16
	fiVAEoK13pZiWKj96HfZuYjr8g6t5j1UjhOg0lNbrcL/KG
X-Google-Smtp-Source: AGHT+IHPaXrxmHFVKX7Eql3EMD5x4On0T3oI0issqDZiJ0MoiOv4sD7i0/jMP72156cYMAUC8axQa4qkX4Dj4M+kpkU=
X-Received: by 2002:a05:690c:6213:b0:70e:7882:ea91 with SMTP id
 00721157ae682-7164d4b88d2mr41815867b3.35.1751465525819; Wed, 02 Jul 2025
 07:12:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5018768.GXAFRqVoOG@rjwysocki.net>
In-Reply-To: <5018768.GXAFRqVoOG@rjwysocki.net>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 2 Jul 2025 16:11:30 +0200
X-Gm-Features: Ac12FXynITunG4rG5UQO1EB1vzYUCxa7rAXh-RE6XqfZ0CLPy3V92JuMPVtw6hI
Message-ID: <CAPDyKFp35SjpQmEQ02u7ZbsaFftaett_rBBf-7hbsBpGWH08hw@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] PM: Reconcile different driver options for runtime
 PM integration with system sleep
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Linux PM <linux-pm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux ACPI <linux-acpi@vger.kernel.org>, Linux PCI <linux-pci@vger.kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 27 Jun 2025 at 21:29, Rafael J. Wysocki <rjw@rjwysocki.net> wrote:
>
> Hi Everyone,
>
> This is an update of the series the v2 of which was posted yesterday:
>
> https://lore.kernel.org/linux-pm/5015172.GXAFRqVoOG@rjwysocki.net/
>
> and the v1 is here:
>
> https://lore.kernel.org/linux-pm/22759968.EfDdHjke4D@rjwysocki.net/
>
> This update reorders the patches (again), updates the changelogs of some of
> them and changes the subject of one patch slightly.  It also adds a kerneldoc
> comment to a new function in patch [5/9].
>
> This part of the cover letter still applies:
>
> "This series addresses a couple of issues related to the integration of runtime
> PM with system sleep I was talking about at the OSMP-summit 2025:
>
> https://lwn.net/Articles/1021332/
>
> Most importantly, DPM_FLAG_SMART_SUSPEND cannot be used along with
> pm_runtime_force_suspend/resume() due to some conflicting expectations
> about the handling of device runtime PM status between these functions
> and the PM core.
>
> Also pm_runtime_force_suspend/resume() currently cannot be used in PCI
> drivers and in drivers that collaborate with the general ACPI PM domain
> because they both don't expect their mid-layer runtime PM callbacks to
> be invoked during system-wide suspend and resume.
>
> Patch [1/9] is a preparatory cleanup changing the code to use 'true' and
> 'false' as needs_force_resume flag values for consistency."
>
> Patch [2/9] (which was [3/9] in v2) puts pm_runtime_force_resume() and one
> other function that is only used during system sleep transitions under
> CONFIG_PM_SLEEP.
>
> Patch [3/9] (which was [5/9] in v2) causes the smart_suspend flag to be taken
> into account by pm_runtime_force_resume() which allows it to resume devices
> with smart_suspend set whose runtime PM status has been changed to RPM_ACTIVE
> by the PM core at the beginning of system resume.  After this patch, drivers
> that use pm_runtime_force_suspend/resume() can also set DPM_FLAG_SMART_SUSPEND
> which may be useful, for example, if devices handled by them are involved in
> dependency chains with other devices setting DPM_FLAG_SMART_SUSPEND.
>
> Since patches [1,3/9] have been reviewed already and patch [2/9] should not
> be particularly controversial, I think that patches [1-3/9] are good to go.
>
> Patch [4/9] (which was [2/9] in v2), makes pm_runtime_reinit() clear
> needs_force_resume in case it was set during driver remove.
>
> Patch [5/9] (which was [4/9] in v2) makes pm_runtime_force_suspend() check
> needs_force_resume along with the device's runtime PM status upfront, and bail
> out if it is set, which allows runtime PM status updates to be eliminated from
> both that function and pm_runtime_force_resume().  I recalled too late that
> it was actually necessary for the PCI PM and ACPI PM to work with
> pm_runtime_force_suspend() correctly after the subsequent changes and that
> patch [3/9] did not depend on it.  I have also realized that patch [5/9]
> potentially unbreaks drivers that call pm_runtime_force_suspend() from their
> "remove" callbacks (see the patch changelog for a bit of an explanation).
>
> Patch [6/9] (which has not been changed since v2) makes the code for getting a
> runtime PM callback for a device a bit more straightforward, in preparation for
> the subsequent changes.
>
> Patch [7/9] introduces a new device PM flag called strict_midlayer that
> can be set by middle layer code which doesn't want its runtime PM
> callbacks to be used during system-wide PM transitions, like the PCI bus
> type and the ACPI PM domain, and updates pm_runtime_force_suspend/resume()
> to take that flag into account.  Its changelog has been updated since v2 and
> there is a new kerneldoc comment for dev_pm_set_strict_midlayer().
>
> Patch [8/9] modifies the ACPI PM "prepare" and "complete" callback functions,
> used by the general ACPI PM domain and by the ACPI LPSS PM domain, to set and
> clear strict_midlayer, respectively, which allows drivers collaborating with it
> to use pm_runtime_force_suspend/resume().  The changelog of this patch has been
> made a bit more precise since v2.
>
> That may be useful if such a driver wants to be able to work with different
> PM domains on different systems.  It may want to work with the general ACPI PM
> domain on systems using ACPI, or with another PM domain (or even multiple PM
> domains at the same time) on systems without ACPI, and it may want to use
> pm_runtime_force_suspend/resume() as its system-wide PM callbacks.
>
> Patch [9/9] updates the PCI bus type to set and clear, respectively, strict_midlayer
> for all PCI devices in its "prepare" and "complete" PM callbacks, in case some
> PCI drivers want to use pm_runtime_force_suspend/resume() in the future.  They
> will still need to set DPM_FLAG_SMART_SUSPEND to avoid resuming their devices during
> system suspend, but now they may also use pm_runtime_force_suspend/resume() as
> suspend callbacks for the "regular suspend" phase of device suspend (or invoke
> these functions from their suspend callbacks).  The changelog of this patch has
> been made a bit more precise since v2, like the changelog of patch [8/9].
>
> As usual, please refer to individual patch changelogs for more details.
>
> Thanks!
>

For the v3 series, please add:
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe
