Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3298B256C70
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 10:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751453284; cv=none; b=IIC6TJLNX5hdNXajgB2FvYxCQb/lFdrlSyfL1Qgltb4SCkzdGLtrlGwLGOmMdXf9dm92u5jIkorCWgfSAAkFOnksSeFyQZf1oDSI6j2hgN1IRy3OII3mHZSjIDhAo0Do1+wHpPqe1xaHREvSLosqdJUR6P3qMIpNE9ov2ZSrB8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751453284; c=relaxed/simple;
	bh=x0AFjkDlvAQocIajLTiEtOk7pDjdbIyb5Vl8YoFPFC8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q0rRDINP99NjQOjqEMEJ8/F+wbviKnCZWrEBEDaY57ZsbEuZs8woG0WAVYzkaL4oeOx4Es4ffa9SnwkWCf0LkXAxvWZvP13GKEs790hN8y+GVNkfhJEmX/AETu1x30+Haqdkcnb7+GSPKw6iMZComUbylMdadvHakeniRoQgiv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VpDcCa9s; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VpDcCa9s"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a525eee2e3so4204005f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 03:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751453280; x=1752058080; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZaqLaJib84m+unN67Qm6MiaO9gj1dwxDqxkPHoKHM38=;
        b=VpDcCa9smd/NR8ALKfvOcaR+JRJyPiTN1XWd7ed1bal/ZCgDN5rOUi1ONMr7O792h3
         MYq5MoHmfGGRDa22ksaY6CxDQ9cyWL7ECvzjUt6kVa0Rkjje3sCFlTgVdh3tQ67tCnAu
         wxnjGwBgLkSXEx8ZboMiH0kHW6tFYlERP90oyb4+h7EKFgxE06WkG7ReMFt+P0YSWsnl
         r0qDxw9hKNGfpApVS9pQYKfx98MZ0EdzJuURrGvEfNJf0BvomHi9zYDay1AwReZU7JjB
         5O+fyB0Ty8rLaEzz3KBMmxN3gKEOI/ZMke8WnkdNTjSRXIWJL+NG3V0mE+jJrfA/avVV
         UrPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751453280; x=1752058080;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZaqLaJib84m+unN67Qm6MiaO9gj1dwxDqxkPHoKHM38=;
        b=jAOnKW+iUwVwnM5SG0QsATqNvSs5HiMoLpLPgaKfe0H4nUVX0BV+/de76TjxbTRsnX
         n+jdzT2OaWUr4a0XR+bgcQ/77Mcg7rSxbXoklUUlYX/yNrDdzgmiz9Bq7rm0e4QzNgQa
         OWvUVrdELGW++lyV1Mtlph6KUd1JhuyY4nAwYHLPIKnjyJtuoAnAhsnXe/abvmV7BtT9
         xsvNYralRNzJDXKaiMECRXUWK8ffmX3nj7KwPLvc/kSkUtO6JTv/r58Pi4gQpsz0BUyV
         dfpCHMNg6PECH7A5YqG1HVLf6zQhPjYrVaFdiF7XWt/7aXwwKO+stbfZ9DpUNd7zd32B
         jAyg==
X-Forwarded-Encrypted: i=1; AJvYcCUd1qFkqkklEmyb4JbuM2O6HZZcgB5OkCk+oWtnZpkBZnGLq167CTZ3kBTQ78aB8cw2wOIiJa5tFY4vq0w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgWKqeuQpqBaOf2ApJ8a/efCoaq//wZ5NzFUxw+4wXA0lihu0R
	Tvzydjiq6/WbVxfgmxF/FA/gqF2vPWBKGI57pJVSio6r413a1NqjRpKzRPM4ORENiIk=
X-Gm-Gg: ASbGncutkYf0W5345dl/6zqEmzMG/HtcN6r6MrzjOuUaJ09LqBgcz0n1h/qPZZ5UvV/
	RZtNJnic/fNXWWMRQQYS1SPFfx8EtY3jaaLjG6ghJlBbgiJ92ID4bK1+U2tPnQ6dgIb0P4OCJnz
	ZkWYp+/ZBrKZ0alRjxIxZpvh2Now2lu6cX/39jcoYQ5p3AhfXr5dj6mdFFOG9ueNY5b2RfWhJQw
	/YFu9uZhv0SE1yAgi7uPQWeV9hgzY09lJuoEzjq4Ei5MNldCIQvbxeIqZ9vxc8pe6ntvCkQB0jF
	88Qm2IGnl9pvbHHaGVw3j9B3JN66GN3lvAWAJo2B//m5lboGKiJis0O7j3zek2qxWlRDPOVIzGI
	t
X-Google-Smtp-Source: AGHT+IFDoHf+aaq4UzigGUWl+x39S/WR6MN+OvN18dQGCVdn/JrZS6PzX26KE9GWmWHItZgUMtOHpw==
X-Received: by 2002:a05:6000:4718:b0:391:3aaf:1d5f with SMTP id ffacd0b85a97d-3b200e2a0e3mr1859101f8f.52.1751453280453;
        Wed, 02 Jul 2025 03:48:00 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5f8a0sm15970228f8f.96.2025.07.02.03.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 03:47:59 -0700 (PDT)
Message-ID: <78b13bcdae82ade95e88f315682966051f461dde.camel@linaro.org>
Subject: Re: [PATCH v3 bpf-next 1/4] kernfs: remove iattr_mutex
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Song Liu <song@kernel.org>, bpf@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org
Cc: kernel-team@meta.com, andrii@kernel.org, eddyz87@gmail.com,
 ast@kernel.org, 	daniel@iogearbox.net, martin.lau@linux.dev,
 viro@zeniv.linux.org.uk, 	brauner@kernel.org, jack@suse.cz,
 kpsingh@kernel.org, mattbobrowski@google.com, 	amir73il@gmail.com,
 gregkh@linuxfoundation.org, tj@kernel.org, 	daan.j.demeyer@gmail.com, Will
 McVicker <willmcvicker@google.com>, Peter Griffin	
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	kernel-team@android.com
Date: Wed, 02 Jul 2025 11:47:58 +0100
In-Reply-To: <20250623063854.1896364-2-song@kernel.org>
References: <20250623063854.1896364-1-song@kernel.org>
	 <20250623063854.1896364-2-song@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+build1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

On Sun, 2025-06-22 at 23:38 -0700, Song Liu wrote:
> From: Christian Brauner <brauner@kernel.org>
>=20
> All allocations of struct kernfs_iattrs are serialized through a global
> mutex. Simply do a racy allocation and let the first one win. I bet most
> callers are under inode->i_rwsem anyway and it wouldn't be needed but
> let's not require that.
>=20
> Signed-off-by: Christian Brauner <brauner@kernel.org>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Acked-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Song Liu <song@kernel.org>

On next-20250701, ls -lA gives errors on /sys:

$ ls -lA /sys/
ls: /sys/: No data available
ls: /sys/kernel: No data available
ls: /sys/power: No data available
ls: /sys/class: No data available
ls: /sys/devices: No data available
ls: /sys/dev: No data available
ls: /sys/hypervisor: No data available
ls: /sys/fs: No data available
ls: /sys/bus: No data available
ls: /sys/firmware: No data available
ls: /sys/block: No data available
ls: /sys/module: No data available
total 0
drwxr-xr-x   2 root root 0 Jan  1  1970 block
drwxr-xr-x  52 root root 0 Jan  1  1970 bus
drwxr-xr-x  88 root root 0 Jan  1  1970 class
drwxr-xr-x   4 root root 0 Jan  1  1970 dev
drwxr-xr-x  11 root root 0 Jan  1  1970 devices
drwxr-xr-x   3 root root 0 Jan  1  1970 firmware
drwxr-xr-x  10 root root 0 Jan  1  1970 fs
drwxr-xr-x   2 root root 0 Jul  2 09:43 hypervisor
drwxr-xr-x  14 root root 0 Jan  1  1970 kernel
drwxr-xr-x 251 root root 0 Jan  1  1970 module
drwxr-xr-x   3 root root 0 Jul  2 09:43 power


and my bisect is pointing to this commit. Simply reverting it also fixes
the errors.


Do you have any suggestions?


Cheers,
Andre'
