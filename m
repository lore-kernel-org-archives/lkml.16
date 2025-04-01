Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057381F0E29
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 11:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743508593; cv=none; b=FQ610tLEyTRJuJ9IMhtVROKIb5dcY0Zdfffm+2HNPv4sRB8RjGnTdvtwv29NKGtr51IbrqJ8Gz1OVJ2n0gKjTHTMK57Cm1BOI/egPS12Fru3Df9BHIkyWTyn6x5vVc2KuQsV2VAyroUpGgoXM4BdzSet0MLXgjFTvff7/96IIA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743508593; c=relaxed/simple;
	bh=x7czy4UI9IbqMfgh6Sv6bpB4w4cV0fLNV/AFpcTrzek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t/Rq1TRLaGmEdgyh/fhsEYGBESWvQKwokADgX9+Akc53OxMbOLJaWLaHGImfYBLEoiYoDv1V1tPNTEXzDGqfTGDIlfDCJFUXzzXsF0Nn1RQzRtAfTq1YIkku1LBkdwu07IGlZzTukoNJ/+A162CFKk+svMeOVnKGJw3KDzRcahk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MvGjCGqn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MvGjCGqn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743508590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l9OKWbJaDtqVih7gFwHKrfvK0bj/Hx7MnBlxug/FBXA=;
	b=MvGjCGqn3w//OlfznNmgEu6EfSm8s89ZgVl+h8aL509TTP2ACOyUa8fpiAhlu81c9LrQpe
	XEKWd7B47k0AtYlgMb//5zFjNZI/G8Ahl4CsCAO7NYh2bC+bke4YdGRdoRI2fIgejFFI3w
	wmR5pPPWB/fGPc1OgejwoZq0RQW2/ak=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-cU_NW022MIObATaRNtYu-Q-1; Tue, 01 Apr 2025 07:56:28 -0400
X-MC-Unique: cU_NW022MIObATaRNtYu-Q-1
X-Mimecast-MFC-AGG-ID: cU_NW022MIObATaRNtYu-Q_1743508587
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3913aea90b4so2237553f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 04:56:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743508587; x=1744113387;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l9OKWbJaDtqVih7gFwHKrfvK0bj/Hx7MnBlxug/FBXA=;
        b=WrgAabK3SyHduWSc9byI4jQ6xiERNeUQvVhMGHCni1itRB8ILDFYFZilD0d5jnchmE
         jcrOyLqKWZ+PLcbP7+t9FFIvoAPuT/bZtV3JNUwADOxzhyz6cDLpkO0c9fGm1/s6Zlx6
         MJdJCOwbXnaKNPXMPBa2+cCIQ+WMi18fgx6Ore8HVNH7u05Eq3jxI1/6nJwWAdD7rGwX
         f9V7dS8xEgClYGqMLyypMISSI/w3zltny2ISu76EAywkfz7C4cNnCwYg2M0kTZj5PPRg
         ixr3cHL+yxlQjenLVM4YJfLaiBoVvMQPUQuw+BXLgq60FDB1y3++CzMfgWvDi4uJdtzl
         vlSw==
X-Forwarded-Encrypted: i=1; AJvYcCVGIu3zpZfPaVmPfqSa3VBftgGgC7PYyRjRpkeMH9dKofJW5on1Yntumuqu+mRcHZ6H00zO9iZSBfrO1/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXiDgqTUEI0wfu7BhYWRNq6zBNMMm6RxCcefaLJE59rDGubCj2
	88e6CxCjwViX8LCOWcl2W1r3f6tfR9XjSIsN0Y5Nzg1Yd2Abu5Jc1/63d4MMDzODEuaRlfwCw0I
	dtxvTj71CSN+c9fMO5SfLPA6Mp8s9WVwi/hO28u6gBbIWkZ+wxVBcYXtnovSE6A==
X-Gm-Gg: ASbGncsjtvgi0vECtsSiNN8J1szE7b0PqLjsun1XRBBopsgroqrsWW1ZDYq7BE5MCoj
	TDeSWN7ndWLXpeMmmVzUKtQJiI1HVqiwXVJEE+EyOI9x92GtbC6c5nfeTy0dJUrB+PR3l1N4tOo
	ufveICD9TXSmcY7bPB8cKzpSxt2buHg08+DbYLF+qTFok58KmuKF1PnqVlEC4ntN1+giO9Tuh9P
	BuLRW427Sq3dZVNRBY5SXmVzPbKvRx0UlN4Efg9saFeqWEDcRoDTwVzwzOfc6kSQpUEtgQrLjfe
	5KUiqYdYv+hIWGVfCuXf1Lc208cLZd9P8232j9YuDZ1+6A==
X-Received: by 2002:a5d:59ae:0:b0:391:4389:f36a with SMTP id ffacd0b85a97d-39c1211cf8dmr9667240f8f.48.1743508587412;
        Tue, 01 Apr 2025 04:56:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHI0izcLrOFWsXGtZJ0/0M5K+6Lci6R57w6rsNHjR4GKFA4ajpQUp1BsvVdzZaWhFVqaYV58Q==
X-Received: by 2002:a5d:59ae:0:b0:391:4389:f36a with SMTP id ffacd0b85a97d-39c1211cf8dmr9667213f8f.48.1743508586985;
        Tue, 01 Apr 2025 04:56:26 -0700 (PDT)
Received: from [192.168.88.253] (146-241-68-231.dyn.eolo.it. [146.241.68.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66363fsm14402167f8f.36.2025.04.01.04.56.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 04:56:26 -0700 (PDT)
Message-ID: <0a240ac2-3280-4831-8db2-214cb6e45f0b@redhat.com>
Date: Tue, 1 Apr 2025 13:56:25 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] vsock: avoid timeout during connect() if the socket
 is closing
To: Stefano Garzarella <sgarzare@redhat.com>, netdev@vger.kernel.org
Cc: Michal Luczaj <mhal@rbox.co>, George Zhang <georgezhang@vmware.com>,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andy King <acking@vmware.com>, Eric Dumazet <edumazet@google.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Dmitry Torokhov <dtor@vmware.com>, Simon Horman <horms@kernel.org>,
 Luigi Leonardi <leonardi@redhat.com>
References: <20250328141528.420719-1-sgarzare@redhat.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250328141528.420719-1-sgarzare@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/28/25 3:15 PM, Stefano Garzarella wrote:
> From: Stefano Garzarella <sgarzare@redhat.com>
> 
> When a peer attempts to establish a connection, vsock_connect() contains
> a loop that waits for the state to be TCP_ESTABLISHED. However, the
> other peer can be fast enough to accept the connection and close it
> immediately, thus moving the state to TCP_CLOSING.
> 
> When this happens, the peer in the vsock_connect() is properly woken up,
> but since the state is not TCP_ESTABLISHED, it goes back to sleep
> until the timeout expires, returning -ETIMEDOUT.
> 
> If the socket state is TCP_CLOSING, waiting for the timeout is pointless.
> vsock_connect() can return immediately without errors or delay since the
> connection actually happened. The socket will be in a closing state,
> but this is not an issue, and subsequent calls will fail as expected.
> 
> We discovered this issue while developing a test that accepts and
> immediately closes connections to stress the transport switch between
> two connect() calls, where the first one was interrupted by a signal
> (see Closes link).
> 
> Reported-by: Luigi Leonardi <leonardi@redhat.com>
> Closes: https://lore.kernel.org/virtualization/bq6hxrolno2vmtqwcvb5bljfpb7mvwb3kohrvaed6auz5vxrfv@ijmd2f3grobn/
> Fixes: d021c344051a ("VSOCK: Introduce VM Sockets")
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>

Acked-by: Paolo Abeni <pabeni@redhat.com>

