Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A810F1991B6
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 02:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750644575; cv=none; b=AO2bE9XXyopRv4434gcAosLrm+1idIeWXFQaBwFoYatARRLykz1mqhSjgDi+5re92pXOCP/OZnr7W6p6zIURzW903v8OwfkNjgd/dpuLTBUaoMN+RQpuVmyw0mYbDIe7LnI/ZaNzDo73QNtZIE1+hGikZE85umyD5+Eg9wwf9MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750644575; c=relaxed/simple;
	bh=x7hpiDR4qKglD7Ir5DagYi1QENn/t1iu+UDVk8rRHpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VsEPK+Lo82vZk0FNyLi067l1pl5/0maxt86Np6/emM/34/NGtAIaXzetMxl1nN5Y8ZLysj+xu4pVD8OnNobEPgbIP9f/fpgkpxlG1U6Rk7QNddet1PSbQAMd77VhCpMoxYE2EFo0uB1hJIGldSpSIh0Go4EBVLQ7JfCA/5sqmLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RIaoyvH4; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RIaoyvH4"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso2718636b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 19:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750644573; x=1751249373; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RJgHAjKlP+uQglnNSL7ta3bomofU87c73wx7U9vhabo=;
        b=RIaoyvH49HBPs51B7bkGzae8O9K1clEqpohUcrM1j6roxkDRlVpQCX9HxvuknTl2Ko
         ENSfqWHT7rKYOD82dOXgaMDLekgna6hGz+lq82MP3SbaORVmUDkleiYLgK0nFC5axq4a
         b38G2d70+tzhvW/q2Zk9Jw3oJcQEu/rxvtp1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750644573; x=1751249373;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RJgHAjKlP+uQglnNSL7ta3bomofU87c73wx7U9vhabo=;
        b=bdH69FyomQxuv+sB2kMdlBbx7XZiYb5GTcdAVrqZAXp2Ckr2GOBxuU3It71bEj2bz6
         Y2v/AsXpKZvWFsojAL7wXBt4U4sUF8TpsTtkam5LcQ/1DZMNM8MKUJe2VW6f8U0epq6g
         YHQ22ncOLwEj8DMHjC8/xX0HRaQ+9UQIFf/3I+fGSQMsAV/h4Mmq6whe7jx0dJI30th0
         bH/gg5qE4Erfo002JVzSrIHTeeN33MhlQNsez4eGL5LJGPkGS3N2IziviHJUgGADlK//
         qNSkAlbGDHCJ+MuzXkpyd6J0IspY7upXGvkryphAn1qgOaWYmJ17CsD1fUtY2Md1mwA1
         V8LQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUrpg0hV/2is6FeJ963z34pmRmnEmByDcB7hWeVGcQuebKWNuzqvBoLek2YBIqOFq41aMnscjzNREupbg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPvU/GsKJ16gnTgH67keTNqdepZXtOIQpKLmmV/qx5oPDKrqnm
	u6DXmtmNZtBgF1foZzOL5j5ksgy4hA2VlroT3Jvudz/nzCUFpIOd0nl+ot1REFEdGH199yTquq+
	CAJk=
X-Gm-Gg: ASbGncup7+YI1saGRorvxquGM0OiM3Vp2DE/YMCplWAD3ZOKWgvNkhAvLjEF1Xff5FN
	kwJBuqWzxn0YcWLr42qA8j7eYtr3rZnoHd3BffnfmQevp/0HohdgvMiWoDRInf8qBJOhP+HHLGp
	TtREZvn9c4pIr09JFkuRuPNlkbuSr/jXcBYIdZ83Y29EVbR40ExRzsgHrl/DInSiFQwF3JDoYco
	1xRWnWWb1xIEh7R+lL77QmQHNnBfSqO1TCVwgKHeo3VZMyeoyBcWaaiJVpASBW1p1DncPo0gzX8
	eXt8NiUSofwt+4m1l38FVnshYMrNVvtQCBO2eDcro/eebRo/s7Yr0SQZCaQiRMIe
X-Google-Smtp-Source: AGHT+IG6cUGGcE1aPZGXsILZBQLtYk0/qTh3KpldgGraVWjCXgnv13V8iaPuV2aRqOBbSlL69Z4D7A==
X-Received: by 2002:a05:6a21:7a47:b0:216:1fc7:5d51 with SMTP id adf61e73a8af0-22026e9ca83mr17370601637.37.1750644572967;
        Sun, 22 Jun 2025 19:09:32 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:b9f:1985:9000:6db2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a46b8c8sm7353540b3a.18.2025.06.22.19.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 19:09:32 -0700 (PDT)
Date: Mon, 23 Jun 2025 11:09:28 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Richard Chang <richardycc@google.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Minchan Kim <minchan@kernel.org>, Jens Axboe <axboe@kernel.dk>, bgeffon@google.com, 
	liumartin@google.com, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org
Subject: Re: [PATCH] zram: support asynchronous writeback
Message-ID: <jpj6huz4rqophy6xpgvfnlydhajzal6fbxfteydl7ihzanpqn4@e7esbgc75gss>
References: <20250618132622.3730219-1-richardycc@google.com>
 <n6sls56srw265fmyuebz6ciqyxqshxyqb53th23kr5d64rwmub@ibdehcnedro6>
 <CALC_0q8-98y0v_jV6QOFTKRAGhJ4nCXZ=q9wutLZPCE0KnKymw@mail.gmail.com>
 <x54netqswex6fpv46nlmeea3ebnm32xnwask4zxw7nmcn7tqdz@4mu4hwsa7hsb>
 <CALC_0q-aRtNS8c00nCD0key27UH9-_2kW=PoXQKrLQ5bg6MU_A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALC_0q-aRtNS8c00nCD0key27UH9-_2kW=PoXQKrLQ5bg6MU_A@mail.gmail.com>

On (25/06/20 13:56), Richard Chang wrote:
> Hi Sergey,
> I copied three linux-6.16-rc2.tar.gz tarball files as the data set.
> 
> Test Flow:
> - mkfs on the zram device, mount it
> - cp tarball files
> - do idle writeback
> - check bd_stat writes 185072 pages

Sounds good enough.  Please add as many details/numbers/etc.
as possible to the future commit messages.
