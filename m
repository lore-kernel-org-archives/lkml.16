Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF733A1BA
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 08:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743062862; cv=none; b=joykJbo58c5t1uWNNivIFq5zKMyWs2CIrrVbxc14eHQWne2zNv1GlUXkfcKoyPXnGPL5ovKwQWf7ifYe1Od8BGId26HFH0cm6r+kAosFBITf2qs0tVJiha7Q241VtgMb4ZHQ4A0lMB4Ij74D0ayDertOupdjbKqLL2sJ4mFKQGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743062862; c=relaxed/simple;
	bh=4ezdhvRG752lNF06p+pkLpdBFgUqGCchaKVKYcbj6Ys=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CAlNGkEp1/4NEnYBreVv2nHIYjmBP3UzbIYFjDtEb8cpPANhwgDn5UX4yYg070Wje57rH0IDbO4Varo/OzYCLaSTIYBkmxVxB0C7wlBWB3e1a5fUk+NryLvIq2ti1puzFykoO1SAGrYZfuQvaa51SRwq85YjuTKjUpmgoVhPI8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RUIKghF3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RUIKghF3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743062858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4ezdhvRG752lNF06p+pkLpdBFgUqGCchaKVKYcbj6Ys=;
	b=RUIKghF3WEjbn+Z25IoIk7n45cr4Twj593QVZy7hSg3UvlH2BMbobq6OpPqjsI35rSDBWi
	rere6DhlW9pZ4bO7SEkhBCUhDB9omqA5JhUS+rqVEB0R+p6+/dEdQEGhB0ZW4MvypH+HgN
	bCOx5HGYf6i/HYZpHah+NuqM1b+G/0U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-495-vQnYx15TNVyka5V3Io73Cw-1; Thu, 27 Mar 2025 04:07:35 -0400
X-MC-Unique: vQnYx15TNVyka5V3Io73Cw-1
X-Mimecast-MFC-AGG-ID: vQnYx15TNVyka5V3Io73Cw_1743062854
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43cf3168b87so3139555e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 01:07:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743062854; x=1743667654;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4ezdhvRG752lNF06p+pkLpdBFgUqGCchaKVKYcbj6Ys=;
        b=qmgj6/E2SAn15SoeHZQzmRAkmyyplyJ1sDb41FnrKJoIMB7b5lSynBsDk6zMa594yT
         XxfbYPekaQZcWdm42Yp5gxLG0oizPLrOuzj1VE8tsd7U83IJGUegBuLuWR+LWCl3p38r
         ZR9z2PnCPyd/gCqnilYgg6hMb3io2a2LnjjKb+O5FVpw6cLjzQbdY6ZufwuSjhj7Gz/m
         HdXMLsLJqaSu6W6pEl5zqxZ8PQw8QViuYKzntVvlWLWV1Hp99NOaITejx/xqgzr3ec6m
         rTdXxAuOeLLryK1vEP+0IXiWdjl+S+tsTpN111vB94FbETRqDvMZQ264BBtVehWCB3fx
         la2Q==
X-Gm-Message-State: AOJu0YxEW3KJlkWxKMfu4VIdHcBgpJaz/EUV8JWJQNKxY9NCu+7sMUSf
	bQb7vsy4eZEmU2j4Zsa28bsQx+CBtYrs8mtXwEJnM6eBRdHXDHPIeA6k9KyCS5JvbRSn2YYfKxE
	GZdcuDIGkjpXBrCfeVbUYQVdJNt/iNJBH5Ah2S00JoReyMcQXejB3mhF8looFog==
X-Gm-Gg: ASbGncuXCWtoaf/kZsPAqVjwzif0YS6sbZ+jeLYtAh4fZKKZuPMnh9O7/wbK9w4LTnf
	cOX15+Tu8d26Kv7unF/YgmO6J25R7EWl1YKn/mngwNIVYFXVTHY0vwjv1JwSK/XGWGgCnREIoA/
	+xMbW3gjdFJ75Pd3XC6uQD1CnEpbrqGlRKKWRMo6xuwYNj+ga6d+SH2a6k4r9h8yW5QVOY7B7ZD
	dnlaa/8nfqsRoY+x9NwVCYfTyf2zV7RjujhqZfGvIniIaXFLHpmVWtRLrTAG+JmZ0rDY3WozTN/
	O/DnrvlL2y8kXfoj3fiYDXhv9aEL7YktgT0ScuLHZQ==
X-Received: by 2002:a05:6000:1842:b0:391:4231:40a with SMTP id ffacd0b85a97d-39ad17544c0mr1979107f8f.33.1743062854312;
        Thu, 27 Mar 2025 01:07:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGf9uN/JgNXtFj9T7MptoPFKJeJA6rQyEYSZhVSVIbyMTAAE7/6rGO9+dey28XZtQL+Otguag==
X-Received: by 2002:a05:6000:1842:b0:391:4231:40a with SMTP id ffacd0b85a97d-39ad17544c0mr1979086f8f.33.1743062853916;
        Thu, 27 Mar 2025 01:07:33 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82dedeaesm31226775e9.4.2025.03.27.01.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 01:07:33 -0700 (PDT)
Message-ID: <eebfe0d0dc31ab33fcdd190eb4a35c6f8b68ac35.camel@redhat.com>
Subject: Re: linux-next: build warning after merge of the ftrace tree
From: Gabriele Monaco <gmonaco@redhat.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Steven Rostedt
	 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Date: Thu, 27 Mar 2025 09:07:30 +0100
In-Reply-To: <20250327180152.260be33b@canb.auug.org.au>
References: <20250327180152.260be33b@canb.auug.org.au>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-03-27 at 18:01 +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the ftrace tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> Documentation/tools/rv/rv-mon-sched.rst: WARNING: document isn't
> included in any toctree
> Documentation/trace/rv/monitor_sched.rst: WARNING: document isn't
> included in any toctree
>=20
> Introduced by commit
>=20
> =C2=A0 03abeaa63c08 ("Documentation/rv: Add docs for the sched monitors")
>=20

Thanks for reporting this! I forgot adding the pages to the indices..
Preparing and sending the fix.

Cheers,
Gabriele

