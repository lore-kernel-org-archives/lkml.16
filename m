Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB96910FD
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 00:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738541955; cv=none; b=c7nRHV+CDeZ7ippu1xWWY9N3Vh0GAH84f2310fFEsoix3v6Y0AqvgPeBy4TJhZ26Dudw9kRMwTaqL8N5NxYC3tWT4VvGzTttU4YmjQhGeys7+NXT6mFITl95AF6mBohTVeEJogRfsN+OqtqnuR4wCbdtieXudtesnVssJX4OVhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738541955; c=relaxed/simple;
	bh=2YZmbXo1wL0LKZHCmnlP5NuWpSw4oSuUBQvKOH9Yp88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EBh1qRDo0dkdHuPuqztec/OyPrvuD7rJA/XWqWqMkBAtgVq95XZFX+arC/DhNngP8AHiEyGoPdsbvt+fHi7jkmpRydUbP6RgLDfbsM+jTlBFsfkz0WXegfoNmX0fidClpWtyK8O3C/2bWt8BUmH1cbjbB8ZDmqCvfpR4XFvGgi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=fE22bMy0; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="fE22bMy0"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ee9b1a2116so779254a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 16:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1738541953; x=1739146753; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CD8OS0v/yDUliDZljFbLDPJ3YJ6X1i9bJSHN/SY1h0=;
        b=fE22bMy0lmlIiKn5xFt/ZE59wRo1T2xtDGwZixveftwFBs56B85SJ4OBJywJyoGJA+
         DYFFMo5109I5TBvGYCu+JO/l8A2dMCGeGV+KJtj/TBS3mJVrqwAvRBQRtZtwprwNGV+q
         VRInboLSk4eKtP/W4IVRa7gtpIQ2XaP3vtKkT5ugyQbkg371BDBPvgI/UThXU7z3H9Bn
         EJ9YwOQ1SEi/Sd6xBJC6yw0BkbsyguaW7MFFXsYKwBAhl3zFvxBz+YTkwtKF6RDB4uxc
         IHo24saUbSvKxTgkvHIli4YqZ8LenNrWtWCe5EcIzBAktjBEr0sXaOPE4AR+QYswlp7B
         Weig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738541953; x=1739146753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CD8OS0v/yDUliDZljFbLDPJ3YJ6X1i9bJSHN/SY1h0=;
        b=h8K87NP/zAqqmrlnN5Z+yz3U3irvgsTI9IF/dN7vGVJEiOP4c2WvO7uxXszcSNpvEZ
         JwN/ovv6gkYbvRy21QlmenQMBawf9pKbzXajZis3TSlLiL+r24zzf/sclELU5pud/rcR
         p1h4T/e58u8xsg/NuwfPdmq2u3mKTZQ5ypkVgS7DuIPdmyOc+GIaGO6lQBLduF8Xed/S
         s1Asc9cxOEe3t2luhMrPsrxSh2bRS37mW0KpiovqNFlu38x37yrhazzm0yMkC0cmWoyh
         iSI1KoK1St5Ap/Vw3Qc5DqvOEUEDNbEV1cIHWdxZQhh8B7tMlr+m8/dsCHcdXGHoTOcC
         Y6jQ==
X-Forwarded-Encrypted: i=1; AJvYcCXa2svBWmYK6NW3M09zIJNSTOKKBD6ycbe7isitGGIa4A2JmnNO49fBK5bGiqWytWVJcdFRSHWH5DCY0nY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7KU1HJOq6kgvValhRULqqLnC915vbjBdpopATYWT7BBNf83zL
	Qf8sLRfR9tnmfOihcrWaOF9tck2HWDFza3HWYi72u4HRAM3yal5GHfraVOVdd3jgTAE1pvUmB4R
	YP1gBZcIY3Y/E4P6IWwKC/jmRAXreP2KkIY6BpULjVMnMNTGbAM8=
X-Gm-Gg: ASbGncvof2z9rs+47FMtUXcd7rz7T/3vuYLtK9/xyJtmy2OwxaVr1hzzh0dohVvj/6b
	gVMmQTgNCXN8BRPzK9/O40NABkBFD0OdbhJzHJJjRfYl5/CZgT0ZCZsbMzgWRaMImPW97YFo=
X-Google-Smtp-Source: AGHT+IFmzoWCYaEfo5enZeTMzTrar2GW00RaNdMzCm+dxuNCQvwT32LxLfM4mpkC355ACLYCKpn75ZVcF4TOn8qxYt0=
X-Received: by 2002:a17:90b:2cc3:b0:2ea:bb3a:8f09 with SMTP id
 98e67ed59e1d1-2f83aa65d88mr11673305a91.0.1738541952924; Sun, 02 Feb 2025
 16:19:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250124184311.1642797-1-csander@purestorage.com>
 <9ea74200-7cbc-4a30-9503-864dcec9b45d@suse.de> <CADUfDZoT7JW+d+j6YNmWJ3CKZ45gbvcUSsE6boZwE1C3iXw2_g@mail.gmail.com>
 <f75c62ce-04a7-4bc0-ae77-8ed80842bf37@suse.de> <CADUfDZrvHmYQgqu5GiQDrAg_MOEiRigCLCmBSO6jeyd1z+Q-JQ@mail.gmail.com>
 <3bcc6e3f-5172-40d4-a4d4-b0f914b9406b@grimberg.me>
In-Reply-To: <3bcc6e3f-5172-40d4-a4d4-b0f914b9406b@grimberg.me>
From: Caleb Sander <csander@purestorage.com>
Date: Sun, 2 Feb 2025 16:19:01 -0800
X-Gm-Features: AWEUYZlJ4nSE-xwpmFAqYdPyI5t_TuDWsFBFF8tDUCGLXuTuUk3HguK3xGsbwmY
Message-ID: <CADUfDZq3ZqpP9hZhgG1gzyyggG6SCQiHqHdgbm95TU2oZ5QFUQ@mail.gmail.com>
Subject: Re: [PATCH v4] nvme-tcp: fix connect failure on receiving partial
 ICResp PDU
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Hannes Reinecke <hare@suse.de>, Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Christoph Hellwig <hch@lst.de>, Maurizio Lombardi <mlombard@redhat.com>, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2025 at 12:17=E2=80=AFAM Sagi Grimberg <sagi@grimberg.me> w=
rote:
...
> Caleb, can you please make sure to test this patch with TLS?

Can you point me to some documentation for that? I tried setting up a
nvmet_tcp port to use TLS and connecting to it as described in the
cover letter for the patch series (https://lwn.net/Articles/941139/).
But the TLS Server Hello seems to fail with EACCES. Any idea what I'm
doing wrong?
$ modprobe nvmet_tcp
$ modprobe null_blk nr_devices=3D1
$ mkdir /sys/kernel/config/nvmet/subsystems/nqn.nvmet
$ echo 1 > /sys/kernel/config/nvmet/subsystems/nqn.nvmet/attr_allow_any_hos=
t
$ mkdir /sys/kernel/config/nvmet/subsystems/nqn.nvmet/namespaces/1
$ echo /dev/nullb0 >
/sys/kernel/config/nvmet/subsystems/nqn.nvmet/namespaces/1/device_path
$ echo 1 > /sys/kernel/config/nvmet/subsystems/nqn.nvmet/namespaces/1/enabl=
e
$ mkdir /sys/kernel/config/nvmet/ports/1
$ echo tcp > /sys/kernel/config/nvmet/ports/1/addr_trtype
$ echo ipv4 > /sys/kernel/config/nvmet/ports/1/addr_adrfam
$ echo 127.0.0.1 > /sys/kernel/config/nvmet/ports/1/addr_traddr
$ echo 4420 > /sys/kernel/config/nvmet/ports/1/addr_trsvcid
$ echo required > /sys/kernel/config/nvmet/ports/1/addr_treq
$ echo tls1.3 > /sys/kernel/config/nvmet/ports/1/addr_tsas
$ ln -s /sys/kernel/config/nvmet/subsystems/nqn.nvmet
/sys/kernel/config/nvmet/ports/1/subsystems
$ nvme gen-tls-key --subsysnqn nqn.nvmet --insert
Inserted TLS key 005e8a74
$ nvme gen-tls-key --subsysnqn nqn.2014-08.org.nvmexpress.discovery --inser=
t
Inserted TLS key 22d676b8
$ tlshd &
$ nvme discover --transport tcp --traddr 127.0.0.1 --trsvcid 4420 --tls
Failed to write to /dev/nvme-fabrics: Input/output error
failed to add controller, error failed to write to nvme-fabrics device

With debug logs enabled, I see the following:
$ dmesg | tail -6
[  440.405298] nvme nvme0: connecting queue 0
[  440.405403] nvmet_tcp: queue 0: TLS ServerHello
[  440.405433] nvme nvme0: queue 0: start TLS with key 11b456f9
[  440.407836] nvmet_tcp: queue 0: TLS handshake done, key 0, status -13
[  440.422881] nvme nvme0: queue 0: TLS handshake done, key 0, status -13
[  440.422932] nvme nvme0: queue 0: TLS handshake complete, error 13

A tcpdump shows the host sending a TLS Client Hello packet and the
target immediately closing the connection.

> Do you have a reliable way to reproduce this?

Sure, here's a fake Python NVMe/TCP controller that immediately closes
each connection after receiving the ICReq PDU:
```
import socket

def recv_all(socket, length):
    result =3D b''
    while len(result) < length:
        result +=3D socket.recv(length - len(result))
    return result

listen_sock =3D socket.socket(socket.AF_INET, socket.SOCK_STREAM)
listen_sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
listen_sock.bind(('', 4420))
listen_sock.listen()
while True:
    client_sock, _ =3D listen_sock.accept()
    recv_all(client_sock, 128) # ICReq
    client_sock.close()
```
Attempting to connect to it reports an error about the ICResp PDU type
field even though no ICResp was sent:
$ nvme connect --transport tcp --traddr 192.168.1.12 --nqn nqn.abc
Failed to write to /dev/nvme-fabrics: Invalid argument
could not add new controller: invalid arguments/configuration
$ dmesg | tail -1
[1351639.614853] nvme_tcp: queue 0: bad type returned 0

Here's a valid scenario where the controller sends the ICResp Common
Header and PDU Specific Header separately (using TCP_NODELAY to ensure
the sends are not coalesced):
```
import socket

def recv_all(socket, length):
    result =3D b''
    while len(result) < length:
        result +=3D socket.recv(length - len(result))
    return result

def send_all(socket, data):
    while data:
        data =3D data[socket.send(data):]

listen_sock =3D socket.socket(socket.AF_INET, socket.SOCK_STREAM)
listen_sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
listen_sock.setsockopt(socket.IPPROTO_TCP, socket.TCP_NODELAY, 1)
listen_sock.bind(('', 4420))
listen_sock.listen()
while True:
    client_sock, _ =3D listen_sock.accept()
    recv_all(client_sock, 128) # ICReq
    common_header =3D bytes([
        0x01, # PDU-type
        0, # FLAGS
        128, # HLEN
        0, # PDO
        128, 0, 0, 0, # PLEN
    ])
    send_all(client_sock, common_header)
    ic_resp =3D bytes([
        0, 0, # PFV
        0, # CPDA
        0, # DGST
        0xFC, 0xFF, 0xFF, 0xFF, # MAXH2CDATA
    ] + [0] * 112)
    send_all(client_sock, ic_resp)
    client_sock.close()
```
The host refuses to connect, complaining that the MAXH2CDATA field in
the ICResp is invalid. But that is because it only received the Common
Header.
$ nvme connect --transport tcp --traddr 192.168.1.12 --nqn nqn.abc
Failed to write to /dev/nvme-fabrics: Invalid argument
could not add new controller: invalid arguments/configuration
$ dmesg | tail -1
[1351960.082011] nvme_tcp: queue 0: invalid maxh2cdata returned 0

With the patch applied, the controller closing the connection without
sending a ICResp PDU correctly results in a "Connection reset by peer"
error:
$ nvme connect --transport tcp --traddr 192.168.1.12 --nqn nqn.abc
Failed to write to /dev/nvme-fabrics: Connection reset by peer
could not add new controller: failed to write to nvme-fabrics device
$ dmesg | tail -1
[  450.050463] nvme_tcp: queue 0: failed to receive icresp, error 0

And when the controller sends the Common Header separately from the
PDU Specific Header, nvme_tcp_init_connection() now succeeds. The
connection attempt instead times out waiting for a response to the
Fabrics Connect command, since the fake NVMe/TCP controller doesn't
implement that:
$ nvme connect --transport tcp --traddr 192.168.1.12 --nqn nqn.abc
Failed to write to /dev/nvme-fabrics: Input/output error
could not add new controller: failed to write to nvme-fabrics device
$ dmesg | tail -3
[  644.728894] nvme nvme0: I/O tag 0 (0000) type 4 opcode 0x7f
(Connect) QID 0 timeout
[  644.728974] nvme nvme0: Connect command failed, error wo/DNR bit: 881
[  644.728999] nvme nvme0: failed to connect queue: 0 ret=3D881

Thanks,
Caleb
