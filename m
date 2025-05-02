Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313E01946DA
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 04:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746159025; cv=none; b=OQ6n4Lo1C2nccl8J9y4Niuw6JUT/w0kZf/6Kc+O+MDTxb2LP8Qwm1lY2cJwB9usYILE/nhRgVYRO23FMOcmbrI8jSvRkTChdXdRjpgXnaqKsc+IIDFUu6G0p/Uff9r7pr1bULHS3uGY1oaz/0+gDCMRWUPRXXbuqNe40mD/lXKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746159025; c=relaxed/simple;
	bh=Fge6vbi4h8wIVKsMROvoryqPHymk7npmM7v125TA0YE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=llmKyWE/x4zBlVQ8L73HfO1doK68wLAptqLFwaXMnUj/Ho6BQIwApm0PijGt1j/dhxuCqnzCZqNB9DwVbrbr2FKZAkrUQ9RCgSyPrc2DDpdQMBldWnRqAsEvM5Wvk1fjzpS9im9Du/cDkRUqv1YdO2siVtdSKnIJ9UdcL0aoE/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SwW+5u8p; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SwW+5u8p"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-224019ad9edso25539455ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 21:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746159023; x=1746763823; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NfnKdBhEFEQTmr5vx0u8Q+cH2DLCEpKwxgZPzsg5YTo=;
        b=SwW+5u8pehV7HOBmr711AkfyNHOL4fSXim277UPtcieHo/u+bUdppVeYJi9OEH7zHw
         AXaNVME8WQGozDN2AsLl24+xZERh2aDwcQa0IHL7nGcXOZH5tQ7Q4ifNUWk2CcyPDxE7
         Paxpx6CDTK0irOVHkRJ61L5J4hEe+/7qOYB3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746159023; x=1746763823;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NfnKdBhEFEQTmr5vx0u8Q+cH2DLCEpKwxgZPzsg5YTo=;
        b=Rzt2wdMv89/Oes20rbp+6a8DLJOVtbvw2V6+QRXR/tUhw/nWALXpmmudQ/vBjuxbJo
         fjJVAumlr3n9WW6tp0MsNaLSvcYsPHEAu8AUlWhoZF9d3RcmEFmUAOLdw3U8hMs+24Zg
         QGkuJRzguEa1+Jzger60ZbrtGanPafG2GrYD7lwUItZsjD/FWVgwmomsl2eX9VkUxlul
         i9cME9NGSWxjSb49Lt6VJYH+2DMoRt3aI65pGer0m49sVcUD7GjsB1RRrSVBQwzZOUV0
         /fuNYicWNZOmDyDrUVW8NmMFxVyaKzemwttP7OHQRvQXcfOJiJHAagkNRaHacqrM0Rx+
         /znw==
X-Gm-Message-State: AOJu0YzOq/d8h54L17twSKWH/POLdiPg1lClzXdSSWPnZ6eKlSpCzGNc
	iQjQoYbHNHfcTKihZ33Txezdz162+dBlQIQh7DqNFwYf04a3cBodtoBZsHAUSA==
X-Gm-Gg: ASbGncvNswqWoOv0EKQSFPeIw1piha2+k7nqJxKMZpdWAfKRb7K5+VhCoGu/OFi4/gN
	hh/GFJuVBD+6A0U2bTngA3qHOFcPWgyIcrPSkNQ7yKKaMyYVwmC3sKb6zKO/YdCyDcU2QnyLCEe
	2h6rprjzvCiRdlkeFm4Vp13znML4tLo/aVYtIWRnq0SiLf6geXwNoox9bYApISO6WErB3naJJWc
	i/LeBWflw9X9idl2YdnHOWr7MIMYR2J2R+BTuA23CZzSxWnlblpPXfNnDekTgXZeKtNxq3cU0Nn
	/LO55yNPjTmQnOgqweyJg7cNuZ1WXfZ8LoIDR2r+nHA2
X-Google-Smtp-Source: AGHT+IGk019uAAzwpcoNOri8EvY+EgL6M/1hb3zuMucldw9qtnEJAh2U3yfPdTqVBRb9VWQqXWbuJw==
X-Received: by 2002:a17:903:187:b0:223:517a:d2a3 with SMTP id d9443c01a7336-22e1032f5a2mr22798395ad.17.1746159023382;
        Thu, 01 May 2025 21:10:23 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:5d10:8616:2d1f:ee5c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1085e0c6sm4644385ad.75.2025.05.01.21.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 21:10:22 -0700 (PDT)
Date: Fri, 2 May 2025 13:10:18 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, bpf@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [RFC] BPF fault/jitter-injection framework
Message-ID: <5l4btekupkqatpxkfaolqhc5kw5wra3xvd7dosalem6zuo5vp5@vwfd7idoqdzv>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Greetings,

I've been thinking what if we had a BPF jitter/fault injection framework
for more fine-grained and configurable kernel testing.  Current fault
injection doesn't support function arguments analysis, with BPF we
can have something like

    // of course bpf_schedule_timeout() doesn't exist yet
    call bpf_schedule_timeout(120) in blk_execute_rq(rq) if
    rq->q->disk->major == 8 && rq->q->disk->first_minor == 0

So that would introduce blk request execution timeouts/jitters for a
particular gendisk only.  And so on.

Has this been discussed before?  Does this approach even make sense
or is there a better (another) way to do this?
