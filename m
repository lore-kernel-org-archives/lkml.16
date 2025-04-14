Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088CD18AE2
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 16:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744649502; cv=none; b=M20VTXcwnePGb5x8Vbs9SGVzjFHiAyB0ABdOCRYaoSxG+VmqtqT7XMSGvO50McX+cTwcFqzenK9sC8/6UMzAE+PoA+UowD0JtAyTRDDFPw+QCXjX6eVLgWHYSxt0JFgjKX7Ipum8WjXQsijmcqoYhtWCSFiCg3Kk7Z/JYGnKD/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744649502; c=relaxed/simple;
	bh=bMWt97+gFjs8WS5QN0xpsIdimwaOk2pihiWy/orj8R8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pqDk5UP1tvk68h9mi9SPdKoOxD6pZbzbz+jIIVf5S09/3chOkkQFjZ+8z+iUURXVBBlUXlvbyEKiCp+UNaND1g0t1fp6Nn88QzFjCcIUQZLElQ0kaaDAtZZR55MR2bhC1kkYqxiS5FtWfpLTPPKRSMXfXneNDxi8qVnoTUE8Mvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N7HZo218; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N7HZo218"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744649497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M7ebwvhuxkLT23uvP5KyVDea79rZSAmx7birmt8oZsE=;
	b=N7HZo218pYguqBtOzBgcNiwJG/EMQ3hXorNjNMO9915Pg0iymq+hhloZhiQ8/ABLvP1k8u
	OlNtPUBgpvLoydJmVyDKAjYf9y1j/h09PWJTrwoDg0x175rGKv29UpxAbKuuJR0c7xhPyq
	Wzpd/FQVG/idE9NijRrzi14zco/DrWY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-185-xvASS7HDOU-Q63Z3wE66sg-1; Mon,
 14 Apr 2025 12:51:31 -0400
X-MC-Unique: xvASS7HDOU-Q63Z3wE66sg-1
X-Mimecast-MFC-AGG-ID: xvASS7HDOU-Q63Z3wE66sg_1744649486
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 92099180AF6B;
	Mon, 14 Apr 2025 16:51:25 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.225.114])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 2FD3419560AD;
	Mon, 14 Apr 2025 16:51:20 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Mon, 14 Apr 2025 18:50:49 +0200 (CEST)
Date: Mon, 14 Apr 2025 18:50:44 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Tze-nan Wu =?utf-8?B?KOWQs+a+pOWNlyk=?= <Tze-nan.Wu@mediatek.com>
Cc: Bobule Chang =?utf-8?B?KOW8teW8mOe+qSk=?= <bobule.chang@mediatek.com>,
	"brauner@kernel.org" <brauner@kernel.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	wsd_upstream <wsd_upstream@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"chenqiwu@xiaomi.com" <chenqiwu@xiaomi.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [RFC PATCH] exit: Skip panic in do_exit() during poweroff
Message-ID: <20250414165043.GG28345@redhat.com>
References: <20250410143937.1829272-1-Tze-nan.Wu@mediatek.com>
 <20250410210507.GD15280@redhat.com>
 <249567d33e088a340780456c7ecd3ef3ee1433a1.camel@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <249567d33e088a340780456c7ecd3ef3ee1433a1.camel@mediatek.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

On 04/14, Tze-nan Wu (吳澤南) wrote:
>
> On Thu, 2025-04-10 at 23:05 +0200, Oleg Nesterov wrote:
> > 
> > As for sys_reboot(), I think that kernel_power_off() must be
> > __noreturn,
> > and sys_reboot() should use BUG() after
> > LINUX_REBOOT_CMD_POWER_OFF/_HALT
> > instead of do_exit().
> > 
> 
> Yes, kernel_power_off() should not return, but this is the case only if
> kernel_power_off() is invoked by PID 1 through sys_reboot().
> If kernel_power_off() is invoked by a kernel thread (e.g., the thermal
> kernel module) other than PID 1, then do_exit() could possibly be
> invoked by PID 1 after kernel_power_off() on another CPU.

Yes sure, this is clear.

I have mentioned sys_reboot() because (unless I am totally confused)
this connects to the previous report from Breno.

And I agree that we should do stop_other_cpus() first, but let me
say this again: I can't help ;)

But in any case, rightly or not I still think that the init process
should not exit/crash due to POWER_OFF/HALT. We should not mask this
problem in do_exit().

Oleg.

